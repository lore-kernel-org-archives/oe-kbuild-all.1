Content-Type: multipart/mixed; boundary="===============6717516421078005066=="
MIME-Version: 1.0
From: Mike Travis <mike.travis@hpe.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v3 04/13] x86/platform/uv: Update UV MMRs for UV5
Date: Fri, 02 Oct 2020 07:18:19 -0700
Message-ID: <87b98560-74f2-44be-44a6-cb99c07dee57@hpe.com>
In-Reply-To: <202010021749.8peNBL2t-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6717516421078005066==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 10/2/2020 3:09 AM, kernel test robot wrote:
> Hi Mike,
> =

> Thank you for the patch! Perhaps something to improve:
> =

> [auto build test WARNING on char-misc/char-misc-testing]
> [also build test WARNING on tip/master v5.9-rc7 next-20201001]
> [cannot apply to tip/x86/core]
> [If your patch is applied to the wrong git tree, kindly drop us a note.

Hi, Yes, the original patches were applied against v5.9-rc4 and I didn't =

think they changed that much.  But I will look at this one and the =

following two as well as the reference.  Thanks, Mike

> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch ]
> =

> url:    https://github.com/0day-ci/linux/commits/Mike-Travis/x86-platform=
-uv-Updates-for-UV5-Architecture/20201002-085248
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.=
git 4cb1a880e7f774e59c2ebb68187d4811ad9d0c4e
> config: x86_64-allyesconfig (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> reproduce (this is a W=3D1 build):
>          # https://github.com/0day-ci/linux/commit/ee300e616c45bd051cf959=
dd5e10b0168d178988
>          git remote add linux-review https://github.com/0day-ci/linux
>          git fetch --no-tags linux-review Mike-Travis/x86-platform-uv-Upd=
ates-for-UV5-Architecture/20201002-085248
>          git checkout ee300e616c45bd051cf959dd5e10b0168d178988
>          # save the attached .config to linux build tree
>          make W=3D1 ARCH=3Dx86_64
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>):
> =

>     arch/x86/kernel/apic/x2apic_uv_x.c: In function 'uv_set_system_type':
>     arch/x86/kernel/apic/x2apic_uv_x.c:258:6: warning: variable 'pnodeid'=
 set but not used [-Wunused-but-set-variable]
>       258 |  int pnodeid;
>           |      ^~~~~~~
>     arch/x86/kernel/apic/x2apic_uv_x.c: In function 'uv_init_hub_info':
>>> arch/x86/kernel/apic/x2apic_uv_x.c:1027:22: warning: variable 'node_id'=
 set but not used [-Wunused-but-set-variable]
>      1027 |  union uvh_node_id_u node_id;
>           |                      ^~~~~~~
> =

> vim +/node_id +1027 arch/x86/kernel/apic/x2apic_uv_x.c
> =

> c443c03dd0d9762 arch/x86/kernel/apic/x2apic_uv_x.c Mike Travis     2016-0=
4-29  1024
> ad3bc25a320742f arch/x86/kernel/apic/x2apic_uv_x.c Borislav Petkov 2018-1=
2-05  1025  static void __init uv_init_hub_info(struct uv_hub_info_s *hi)
> c443c03dd0d9762 arch/x86/kernel/apic/x2apic_uv_x.c Mike Travis     2016-0=
4-29  1026  {
> 9f5314fb4d556d3 arch/x86/kernel/genx2apic_uv_x.c   Jack Steiner    2008-0=
5-28 @1027  	union uvh_node_id_u node_id;
> 7243e10689fd17a arch/x86/kernel/apic/x2apic_uv_x.c Ingo Molnar     2017-0=
1-14  1028  	struct mn mn;
> c443c03dd0d9762 arch/x86/kernel/apic/x2apic_uv_x.c Mike Travis     2016-0=
4-29  1029
> c443c03dd0d9762 arch/x86/kernel/apic/x2apic_uv_x.c Mike Travis     2016-0=
4-29  1030  	get_mn(&mn);
> 7243e10689fd17a arch/x86/kernel/apic/x2apic_uv_x.c Ingo Molnar     2017-0=
1-14  1031  	hi->gpa_mask =3D mn.m_val ?
> 405422d88c686e8 arch/x86/kernel/apic/x2apic_uv_x.c Mike Travis     2016-0=
4-29  1032  		(1UL << (mn.m_val + mn.n_val)) - 1 :
> 405422d88c686e8 arch/x86/kernel/apic/x2apic_uv_x.c Mike Travis     2016-0=
4-29  1033  		(1UL << uv_cpuid.gpa_shift) - 1;
> c443c03dd0d9762 arch/x86/kernel/apic/x2apic_uv_x.c Mike Travis     2016-0=
4-29  1034
> 7243e10689fd17a arch/x86/kernel/apic/x2apic_uv_x.c Ingo Molnar     2017-0=
1-14  1035  	hi->m_val		=3D mn.m_val;
> 7243e10689fd17a arch/x86/kernel/apic/x2apic_uv_x.c Ingo Molnar     2017-0=
1-14  1036  	hi->n_val		=3D mn.n_val;
> 7243e10689fd17a arch/x86/kernel/apic/x2apic_uv_x.c Ingo Molnar     2017-0=
1-14  1037  	hi->m_shift		=3D mn.m_shift;
> 7243e10689fd17a arch/x86/kernel/apic/x2apic_uv_x.c Ingo Molnar     2017-0=
1-14  1038  	hi->n_lshift		=3D mn.n_lshift ? mn.n_lshift : 0;
> 7243e10689fd17a arch/x86/kernel/apic/x2apic_uv_x.c Ingo Molnar     2017-0=
1-14  1039  	hi->hub_revision	=3D uv_hub_info->hub_revision;
> ee300e616c45bd0 arch/x86/kernel/apic/x2apic_uv_x.c Mike Travis     2020-1=
0-01  1040  	hi->hub_type		=3D uv_hub_info->hub_type;
> 7243e10689fd17a arch/x86/kernel/apic/x2apic_uv_x.c Ingo Molnar     2017-0=
1-14  1041  	hi->pnode_mask		=3D uv_cpuid.pnode_mask;
> 7243e10689fd17a arch/x86/kernel/apic/x2apic_uv_x.c Ingo Molnar     2017-0=
1-14  1042  	hi->min_pnode		=3D _min_pnode;
> 7243e10689fd17a arch/x86/kernel/apic/x2apic_uv_x.c Ingo Molnar     2017-0=
1-14  1043  	hi->min_socket		=3D _min_socket;
> 7243e10689fd17a arch/x86/kernel/apic/x2apic_uv_x.c Ingo Molnar     2017-0=
1-14  1044  	hi->pnode_to_socket	=3D _pnode_to_socket;
> 7243e10689fd17a arch/x86/kernel/apic/x2apic_uv_x.c Ingo Molnar     2017-0=
1-14  1045  	hi->socket_to_node	=3D _socket_to_node;
> 7243e10689fd17a arch/x86/kernel/apic/x2apic_uv_x.c Ingo Molnar     2017-0=
1-14  1046  	hi->socket_to_pnode	=3D _socket_to_pnode;
> 7243e10689fd17a arch/x86/kernel/apic/x2apic_uv_x.c Ingo Molnar     2017-0=
1-14  1047  	hi->gr_table_len	=3D _gr_table_len;
> 7243e10689fd17a arch/x86/kernel/apic/x2apic_uv_x.c Ingo Molnar     2017-0=
1-14  1048  	hi->gr_table		=3D _gr_table;
> c443c03dd0d9762 arch/x86/kernel/apic/x2apic_uv_x.c Mike Travis     2016-0=
4-29  1049
> 7243e10689fd17a arch/x86/kernel/apic/x2apic_uv_x.c Ingo Molnar     2017-0=
1-14  1050  	node_id.v		=3D uv_read_local_mmr(UVH_NODE_ID);
> 7243e10689fd17a arch/x86/kernel/apic/x2apic_uv_x.c Ingo Molnar     2017-0=
1-14  1051  	uv_cpuid.gnode_shift	=3D max_t(unsigned int, uv_cpuid.gnode_sh=
ift, mn.n_val);
> ee300e616c45bd0 arch/x86/kernel/apic/x2apic_uv_x.c Mike Travis     2020-1=
0-01  1052  	hi->gnode_extra		=3D (uv_node_id & ~((1 << uv_cpuid.gnode_shif=
t) - 1)) >> 1;
> ad4830051aac0b9 arch/x86/kernel/apic/x2apic_uv_x.c Mike Travis     2017-0=
3-21  1053  	if (mn.m_val)
> ad4830051aac0b9 arch/x86/kernel/apic/x2apic_uv_x.c Mike Travis     2017-0=
3-21  1054  		hi->gnode_upper	=3D (u64)hi->gnode_extra << mn.m_val;
> c443c03dd0d9762 arch/x86/kernel/apic/x2apic_uv_x.c Mike Travis     2016-0=
4-29  1055
> 1de329c10d9fbac arch/x86/kernel/apic/x2apic_uv_x.c Mike Travis     2016-0=
4-29  1056  	if (uv_gp_table) {
> 7243e10689fd17a arch/x86/kernel/apic/x2apic_uv_x.c Ingo Molnar     2017-0=
1-14  1057  		hi->global_mmr_base	=3D uv_gp_table->mmr_base;
> 7243e10689fd17a arch/x86/kernel/apic/x2apic_uv_x.c Ingo Molnar     2017-0=
1-14  1058  		hi->global_mmr_shift	=3D uv_gp_table->mmr_shift;
> 7243e10689fd17a arch/x86/kernel/apic/x2apic_uv_x.c Ingo Molnar     2017-0=
1-14  1059  		hi->global_gru_base	=3D uv_gp_table->gru_base;
> 7243e10689fd17a arch/x86/kernel/apic/x2apic_uv_x.c Ingo Molnar     2017-0=
1-14  1060  		hi->global_gru_shift	=3D uv_gp_table->gru_shift;
> 7243e10689fd17a arch/x86/kernel/apic/x2apic_uv_x.c Ingo Molnar     2017-0=
1-14  1061  		hi->gpa_shift		=3D uv_gp_table->gpa_shift;
> 7243e10689fd17a arch/x86/kernel/apic/x2apic_uv_x.c Ingo Molnar     2017-0=
1-14  1062  		hi->gpa_mask		=3D (1UL << hi->gpa_shift) - 1;
> 1de329c10d9fbac arch/x86/kernel/apic/x2apic_uv_x.c Mike Travis     2016-0=
4-29  1063  	} else {
> ee300e616c45bd0 arch/x86/kernel/apic/x2apic_uv_x.c Mike Travis     2020-1=
0-01  1064  		hi->global_mmr_base	=3D
> ee300e616c45bd0 arch/x86/kernel/apic/x2apic_uv_x.c Mike Travis     2020-1=
0-01  1065  			uv_read_local_mmr(UVH_RH_GAM_MMR_OVERLAY_CONFIG) &
> ee300e616c45bd0 arch/x86/kernel/apic/x2apic_uv_x.c Mike Travis     2020-1=
0-01  1066  			~UV_MMR_ENABLE;
> 7243e10689fd17a arch/x86/kernel/apic/x2apic_uv_x.c Ingo Molnar     2017-0=
1-14  1067  		hi->global_mmr_shift	=3D _UV_GLOBAL_MMR64_PNODE_SHIFT;
> 1de329c10d9fbac arch/x86/kernel/apic/x2apic_uv_x.c Mike Travis     2016-0=
4-29  1068  	}
> c443c03dd0d9762 arch/x86/kernel/apic/x2apic_uv_x.c Mike Travis     2016-0=
4-29  1069
> 7243e10689fd17a arch/x86/kernel/apic/x2apic_uv_x.c Ingo Molnar     2017-0=
1-14  1070  	get_lowmem_redirect(&hi->lowmem_remap_base, &hi->lowmem_remap_=
top);
> c443c03dd0d9762 arch/x86/kernel/apic/x2apic_uv_x.c Mike Travis     2016-0=
4-29  1071
> 7243e10689fd17a arch/x86/kernel/apic/x2apic_uv_x.c Ingo Molnar     2017-0=
1-14  1072  	hi->apic_pnode_shift =3D uv_cpuid.socketid_shift;
> c443c03dd0d9762 arch/x86/kernel/apic/x2apic_uv_x.c Mike Travis     2016-0=
4-29  1073
> 7243e10689fd17a arch/x86/kernel/apic/x2apic_uv_x.c Ingo Molnar     2017-0=
1-14  1074  	/* Show system specific info: */
> 7243e10689fd17a arch/x86/kernel/apic/x2apic_uv_x.c Ingo Molnar     2017-0=
1-14  1075  	pr_info("UV: N:%d M:%d m_shift:%d n_lshift:%d\n", hi->n_val, h=
i->m_val, hi->m_shift, hi->n_lshift);
> 7243e10689fd17a arch/x86/kernel/apic/x2apic_uv_x.c Ingo Molnar     2017-0=
1-14  1076  	pr_info("UV: gpa_mask/shift:0x%lx/%d pnode_mask:0x%x apic_pns:=
%d\n", hi->gpa_mask, hi->gpa_shift, hi->pnode_mask, hi->apic_pnode_shift);
> 7243e10689fd17a arch/x86/kernel/apic/x2apic_uv_x.c Ingo Molnar     2017-0=
1-14  1077  	pr_info("UV: mmr_base/shift:0x%lx/%ld gru_base/shift:0x%lx/%ld=
\n", hi->global_mmr_base, hi->global_mmr_shift, hi->global_gru_base, hi->gl=
obal_gru_shift);
> 7243e10689fd17a arch/x86/kernel/apic/x2apic_uv_x.c Ingo Molnar     2017-0=
1-14  1078  	pr_info("UV: gnode_upper:0x%lx gnode_extra:0x%x\n", hi->gnode_=
upper, hi->gnode_extra);
> 1de329c10d9fbac arch/x86/kernel/apic/x2apic_uv_x.c Mike Travis     2016-0=
4-29  1079  }
> c443c03dd0d9762 arch/x86/kernel/apic/x2apic_uv_x.c Mike Travis     2016-0=
4-29  1080
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>=20
--===============6717516421078005066==--

