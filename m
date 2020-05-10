Content-Type: multipart/mixed; boundary="===============8903428805590497643=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [linux-next:master 7513/7905] drivers/net/dsa/sja1105/sja1105_vl.c:325:24: warning: Local variable 'rule' shadows outer variable [shadowVariable]
Date: Sun, 10 May 2020 12:15:27 +0800
Message-ID: <202005101225.bLnr4DAU%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8903428805590497643==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   30e2206e11ce27ae910cc0dab21472429e400a87
commit: 834f8933d5ddd732274cb6050252bd1c7cc7349d [7513/7905] net: dsa: sja1=
105: implement tc-gate using time-triggered virtual links

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/net/dsa/sja1105/sja1105_vl.c:325:24: warning: Local variable 'ru=
le' shadows outer variable [shadowVariable]
     struct sja1105_rule *rule =3D sja1105_rule_find(priv, cookie);
                          ^
   drivers/net/dsa/sja1105/sja1105_vl.c:151:23: note: Shadowed declaration
    struct sja1105_rule *rule;
                         ^
   drivers/net/dsa/sja1105/sja1105_vl.c:325:24: note: Shadow variable
     struct sja1105_rule *rule =3D sja1105_rule_find(priv, cookie);
                          ^

vim +/rule +325 drivers/net/dsa/sja1105/sja1105_vl.c

   140	=

   141	static int sja1105_init_virtual_links(struct sja1105_private *priv,
   142					      struct netlink_ext_ack *extack)
   143	{
   144		struct sja1105_l2_forwarding_params_entry *l2_fwd_params;
   145		struct sja1105_vl_forwarding_params_entry *vl_fwd_params;
   146		struct sja1105_vl_policing_entry *vl_policing;
   147		struct sja1105_vl_forwarding_entry *vl_fwd;
   148		struct sja1105_vl_lookup_entry *vl_lookup;
   149		bool have_critical_virtual_links =3D false;
   150		struct sja1105_table *table;
   151		struct sja1105_rule *rule;
   152		int num_virtual_links =3D 0;
   153		int max_sharindx =3D 0;
   154		int i, j, k;
   155	=

   156		table =3D &priv->static_config.tables[BLK_IDX_L2_FORWARDING_PARAMS];
   157		l2_fwd_params =3D table->entries;
   158		l2_fwd_params->part_spc[0] =3D SJA1105_MAX_FRAME_MEMORY;
   159	=

   160		/* Figure out the dimensioning of the problem */
   161		list_for_each_entry(rule, &priv->flow_block.rules, list) {
   162			if (rule->type !=3D SJA1105_RULE_VL)
   163				continue;
   164			/* Each VL lookup entry matches on a single ingress port */
   165			num_virtual_links +=3D hweight_long(rule->port_mask);
   166	=

   167			if (rule->vl.type !=3D SJA1105_VL_NONCRITICAL)
   168				have_critical_virtual_links =3D true;
   169			if (max_sharindx < rule->vl.sharindx)
   170				max_sharindx =3D rule->vl.sharindx;
   171		}
   172	=

   173		if (num_virtual_links > SJA1105_MAX_VL_LOOKUP_COUNT) {
   174			NL_SET_ERR_MSG_MOD(extack, "Not enough VL entries available");
   175			return -ENOSPC;
   176		}
   177	=

   178		if (max_sharindx + 1 > SJA1105_MAX_VL_LOOKUP_COUNT) {
   179			NL_SET_ERR_MSG_MOD(extack, "Policer index out of range");
   180			return -ENOSPC;
   181		}
   182	=

   183		max_sharindx =3D max_t(int, num_virtual_links, max_sharindx) + 1;
   184	=

   185		/* Discard previous VL Lookup Table */
   186		table =3D &priv->static_config.tables[BLK_IDX_VL_LOOKUP];
   187		if (table->entry_count) {
   188			kfree(table->entries);
   189			table->entry_count =3D 0;
   190		}
   191	=

   192		/* Discard previous VL Policing Table */
   193		table =3D &priv->static_config.tables[BLK_IDX_VL_POLICING];
   194		if (table->entry_count) {
   195			kfree(table->entries);
   196			table->entry_count =3D 0;
   197		}
   198	=

   199		/* Discard previous VL Forwarding Table */
   200		table =3D &priv->static_config.tables[BLK_IDX_VL_FORWARDING];
   201		if (table->entry_count) {
   202			kfree(table->entries);
   203			table->entry_count =3D 0;
   204		}
   205	=

   206		/* Discard previous VL Forwarding Parameters Table */
   207		table =3D &priv->static_config.tables[BLK_IDX_VL_FORWARDING_PARAMS];
   208		if (table->entry_count) {
   209			kfree(table->entries);
   210			table->entry_count =3D 0;
   211		}
   212	=

   213		/* Nothing to do */
   214		if (!num_virtual_links)
   215			return 0;
   216	=

   217		/* Pre-allocate space in the static config tables */
   218	=

   219		/* VL Lookup Table */
   220		table =3D &priv->static_config.tables[BLK_IDX_VL_LOOKUP];
   221		table->entries =3D kcalloc(num_virtual_links,
   222					 table->ops->unpacked_entry_size,
   223					 GFP_KERNEL);
   224		if (!table->entries)
   225			return -ENOMEM;
   226		table->entry_count =3D num_virtual_links;
   227		vl_lookup =3D table->entries;
   228	=

   229		k =3D 0;
   230	=

   231		list_for_each_entry(rule, &priv->flow_block.rules, list) {
   232			unsigned long port;
   233	=

   234			if (rule->type !=3D SJA1105_RULE_VL)
   235				continue;
   236	=

   237			for_each_set_bit(port, &rule->port_mask, SJA1105_NUM_PORTS) {
   238				vl_lookup[k].format =3D SJA1105_VL_FORMAT_PSFP;
   239				vl_lookup[k].port =3D port;
   240				vl_lookup[k].macaddr =3D rule->key.vl.dmac;
   241				if (rule->key.type =3D=3D SJA1105_KEY_VLAN_AWARE_VL) {
   242					vl_lookup[k].vlanid =3D rule->key.vl.vid;
   243					vl_lookup[k].vlanprior =3D rule->key.vl.pcp;
   244				} else {
   245					u16 vid =3D dsa_8021q_rx_vid(priv->ds, port);
   246	=

   247					vl_lookup[k].vlanid =3D vid;
   248					vl_lookup[k].vlanprior =3D 0;
   249				}
   250				/* For critical VLs, the DESTPORTS mask is taken from
   251				 * the VL Forwarding Table, so no point in putting it
   252				 * in the VL Lookup Table
   253				 */
   254				if (rule->vl.type =3D=3D SJA1105_VL_NONCRITICAL)
   255					vl_lookup[k].destports =3D rule->vl.destports;
   256				else
   257					vl_lookup[k].iscritical =3D true;
   258				vl_lookup[k].flow_cookie =3D rule->cookie;
   259				k++;
   260			}
   261		}
   262	=

   263		/* UM10944.pdf chapter 4.2.3 VL Lookup table:
   264		 * "the entries in the VL Lookup table must be sorted in ascending
   265		 * order (i.e. the smallest value must be loaded first) according to
   266		 * the following sort order: MACADDR, VLANID, PORT, VLANPRIOR."
   267		 */
   268		for (i =3D 0; i < num_virtual_links; i++) {
   269			struct sja1105_vl_lookup_entry *a =3D &vl_lookup[i];
   270	=

   271			for (j =3D i + 1; j < num_virtual_links; j++) {
   272				struct sja1105_vl_lookup_entry *b =3D &vl_lookup[j];
   273	=

   274				if (sja1105_vl_key_lower(b, a)) {
   275					struct sja1105_vl_lookup_entry tmp =3D *a;
   276	=

   277					*a =3D *b;
   278					*b =3D tmp;
   279				}
   280			}
   281		}
   282	=

   283		if (!have_critical_virtual_links)
   284			return 0;
   285	=

   286		/* VL Policing Table */
   287		table =3D &priv->static_config.tables[BLK_IDX_VL_POLICING];
   288		table->entries =3D kcalloc(max_sharindx, table->ops->unpacked_entry=
_size,
   289					 GFP_KERNEL);
   290		if (!table->entries)
   291			return -ENOMEM;
   292		table->entry_count =3D max_sharindx;
   293		vl_policing =3D table->entries;
   294	=

   295		/* VL Forwarding Table */
   296		table =3D &priv->static_config.tables[BLK_IDX_VL_FORWARDING];
   297		table->entries =3D kcalloc(max_sharindx, table->ops->unpacked_entry=
_size,
   298					 GFP_KERNEL);
   299		if (!table->entries)
   300			return -ENOMEM;
   301		table->entry_count =3D max_sharindx;
   302		vl_fwd =3D table->entries;
   303	=

   304		/* VL Forwarding Parameters Table */
   305		table =3D &priv->static_config.tables[BLK_IDX_VL_FORWARDING_PARAMS];
   306		table->entries =3D kcalloc(1, table->ops->unpacked_entry_size,
   307					 GFP_KERNEL);
   308		if (!table->entries)
   309			return -ENOMEM;
   310		table->entry_count =3D 1;
   311		vl_fwd_params =3D table->entries;
   312	=

   313		/* Reserve some frame buffer memory for the critical-traffic virtual
   314		 * links (this needs to be done). At the moment, hardcode the value
   315		 * at 100 blocks of 128 bytes of memory each. This leaves 829 blocks
   316		 * remaining for best-effort traffic. TODO: figure out a more flexi=
ble
   317		 * way to perform the frame buffer partitioning.
   318		 */
   319		l2_fwd_params->part_spc[0] =3D SJA1105_MAX_FRAME_MEMORY -
   320					     SJA1105_VL_FRAME_MEMORY;
   321		vl_fwd_params->partspc[0] =3D SJA1105_VL_FRAME_MEMORY;
   322	=

   323		for (i =3D 0; i < num_virtual_links; i++) {
   324			unsigned long cookie =3D vl_lookup[i].flow_cookie;
 > 325			struct sja1105_rule *rule =3D sja1105_rule_find(priv, cookie);
   326	=

   327			if (rule->vl.type =3D=3D SJA1105_VL_NONCRITICAL)
   328				continue;
   329			if (rule->vl.type =3D=3D SJA1105_VL_TIME_TRIGGERED) {
   330				int sharindx =3D rule->vl.sharindx;
   331	=

   332				vl_policing[i].type =3D 1;
   333				vl_policing[i].sharindx =3D sharindx;
   334				vl_policing[i].maxlen =3D rule->vl.maxlen;
   335				vl_policing[sharindx].type =3D 1;
   336	=

   337				vl_fwd[i].type =3D 1;
   338				vl_fwd[sharindx].type =3D 1;
   339				vl_fwd[sharindx].priority =3D rule->vl.ipv;
   340				vl_fwd[sharindx].partition =3D 0;
   341				vl_fwd[sharindx].destports =3D rule->vl.destports;
   342			}
   343		}
   344	=

   345		return 0;
   346	}
   347	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8903428805590497643==--

