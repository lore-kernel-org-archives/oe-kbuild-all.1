Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA42F1E9915
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Oct 2025 00:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760661881; cv=none; b=MaCwUsTkBlyNSEiM/tK26n1y8wsRNXK+oAxMr/WN++AiC/4d2hywej5UZjntNjWmHV9R9gew3gwdaf/tuB6OzT+mn+bv02hnotReArVBwqpiIl7XhtM42t6p8Wx++BHZayq972Q7x975Jp4yn0prtTTzsjaktzFrbu3urYoY4Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760661881; c=relaxed/simple;
	bh=R9Ui3umAJQkDBX6AjjWUDaacXh+XEsRhdY8iPGFOTc8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EgEbHTiWwoHpSwHSbhYew86fLnueiQWg5XjNrVkCPqbUS4eAuEDKnbtfLtX098WnNaERYL0QkM/qcc0+KK8LUomQYUnKXTwpfHSeUlWm8v2e/TD09YYH6akpkCuI0NMKYyzoY4myVB9pW2YH8jOpX6qhfqsq1fEeTtrAIQ31N/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jhJmUbjC; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jhJmUbjC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760661879; x=1792197879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R9Ui3umAJQkDBX6AjjWUDaacXh+XEsRhdY8iPGFOTc8=;
  b=jhJmUbjCQzeXxRodSiSlIibWZpIdRAZV2zdaZuqbNxWSgz73UwjAHiSl
   2zpfMteaxwlWWiNZlrCgnBeWqHk9q1OIeH/D9sWPHAjMynBJ7cwJDWerR
   HdV6sgDAb8A6BNh5k1CiChdi2b6kNGtBgqxRuD50kWwpePhSdbf8UiwPN
   2Bm8F+SbVewDkCXu6597Rf/Z8ag0ExGGllV5N2nLaOJTQICkq5x+tWG9a
   39+66ucjbPfJmSwqqjL26ReqkJ5e3UJNhyrGbT/6MM13PJvWCxxPrYC4v
   u4MTdpRuEmopcgFBvyWQxrxDd8O5wBtEbTTfykScKCtyFJJhnAlXHJeS6
   Q==;
X-CSE-ConnectionGUID: pfhxBlrTRvCRlYrFcgKh3g==
X-CSE-MsgGUID: MgDseOaMTNGcGmOT21b7/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="73984092"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="73984092"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 17:44:38 -0700
X-CSE-ConnectionGUID: OcGtD4mZRjKlZAIAV0OHlw==
X-CSE-MsgGUID: lmHi1SJhS0+V6DJy1l6V2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="186618462"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 16 Oct 2025 17:44:36 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9YaA-0005Mp-07;
	Fri, 17 Oct 2025 00:44:34 +0000
Date: Fri, 17 Oct 2025 08:43:50 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Sudeep Holla <sudeep.holla@arm.com>
Subject: [sudeep-holla:acpi_scmi_telemetry 7/15]
 drivers/firmware/arm_scmi/scmi_system_telemetry.c:1179:23: error:
 'generic_delete_inode' undeclared here (not in a function)
Message-ID: <202510170836.6tGajfzt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git acpi_scmi_telemetry
head:   872204541d0c298cab365d5dcd343d9cdb749d31
commit: 6440298ac987ad74689901af6c2009b3621a2591 [7/15] firmware: arm_scmi: Add System Telemetry driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20251017/202510170836.6tGajfzt-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510170836.6tGajfzt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510170836.6tGajfzt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/arm_scmi/scmi_system_telemetry.c:1179:23: error: 'generic_delete_inode' undeclared here (not in a function)
    1179 |         .drop_inode = generic_delete_inode,
         |                       ^~~~~~~~~~~~~~~~~~~~
   drivers/firmware/arm_scmi/scmi_system_telemetry.c: In function 'tlm_mount':
>> drivers/firmware/arm_scmi/scmi_system_telemetry.c:1307:16: error: implicit declaration of function 'mount_nodev' [-Wimplicit-function-declaration]
    1307 |         return mount_nodev(fs_type, flags, data, tlm_fill_super);
         |                ^~~~~~~~~~~
>> drivers/firmware/arm_scmi/scmi_system_telemetry.c:1307:16: error: returning 'int' from a function with return type 'struct dentry *' makes pointer from integer without a cast [-Wint-conversion]
    1307 |         return mount_nodev(fs_type, flags, data, tlm_fill_super);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/generic_delete_inode +1179 drivers/firmware/arm_scmi/scmi_system_telemetry.c

  1176	
  1177	static const struct super_operations tlm_sops = {
  1178		.statfs = simple_statfs,
> 1179		.drop_inode = generic_delete_inode,
  1180	};
  1181	
  1182	static struct inode *
  1183	scmi_tlm_inode_initialize(struct super_block *sb, umode_t mode,
  1184				  struct scmi_tlm_inode *tlmi)
  1185	{
  1186		struct inode *inode;
  1187	
  1188		if (!tlmi)
  1189			return NULL;
  1190	
  1191		inode = &tlmi->vfs_inode;
  1192		if (unlikely(inode_init_always(sb, inode)))
  1193			return NULL;
  1194	
  1195		inode_sb_list_add(inode);
  1196		inode->i_ino = get_next_ino();
  1197		inode_init_owner(&nop_mnt_idmap, inode, NULL, mode);
  1198		simple_inode_init_ts(inode);
  1199	
  1200		if (S_ISDIR(mode)) {
  1201			inode->i_op = &tlm_dir_inode_ops;
  1202			inode->i_fop = &simple_dir_operations;
  1203		} else if (S_ISREG(mode)) {
  1204			inode->i_op = &tlm_file_inode_ops;
  1205			inode->i_fop = tlmi ? tlmi->cls->f_op : NULL;
  1206		}
  1207	
  1208		inode->i_private = (void *)tlmi->priv;
  1209	
  1210		return inode;
  1211	}
  1212	
  1213	static struct dentry *
  1214	scmi_tlm_node_add(struct super_block *sb, struct dentry *parent,
  1215			  const char *name, umode_t mode, struct scmi_tlm_inode *tlmi)
  1216	{
  1217		struct inode *ino;
  1218		struct dentry *dentry;
  1219	
  1220		ino = scmi_tlm_inode_initialize(sb, mode, tlmi);
  1221		if (!ino)
  1222			return ERR_PTR(-ENOMEM);
  1223	
  1224		dentry = d_alloc_name(parent, name);
  1225		if (!dentry)
  1226			return ERR_PTR(-ENOMEM);
  1227	
  1228		tlmi->dentry = dentry;
  1229		d_add(dentry, ino);
  1230	
  1231		return dentry;
  1232	}
  1233	
  1234	static int scmi_telemetry_instance_register(struct super_block *sb,
  1235						    struct scmi_tlm_instance *ti)
  1236	{
  1237		struct dentry *top;
  1238	
  1239		/* AT first create instance top dir ... */
  1240		top = scmi_tlm_node_add(sb, sb->s_root, ti->top_cls.name,
  1241					S_IFDIR | ti->top_cls.mode, ti->top_inode);
  1242		if (IS_ERR(top))
  1243			return PTR_ERR(top);
  1244	
  1245		/*
  1246		 * Scan the array of tlm_inode pre-initialized with SCMI Telemetry
  1247		 * discovered entities and map it into the filesystem .
  1248		 */
  1249		for (int i = 0; i < ti->num_nodes; i++) {
  1250			struct scmi_tlm_inode *tlmi = ti->all_nodes[i];
  1251			struct dentry *dentry, *parent;
  1252			umode_t mode;
  1253	
  1254			/* Check sanity of node tree */
  1255			if (WARN_ON_ONCE(!tlmi))
  1256				continue;
  1257	
  1258			parent = !tlmi->parent ? top : tlmi->parent->dentry;
  1259			mode = (tlmi->cls->f_op ? S_IFREG : S_IFDIR) | tlmi->cls->mode;
  1260			dentry = scmi_tlm_node_add(sb, parent, tlmi->cls->name, mode, tlmi);
  1261			if (IS_ERR(dentry))
  1262				return PTR_ERR(dentry);
  1263		}
  1264	
  1265		return 0;
  1266	}
  1267	
  1268	static struct scmi_tlm_inode root_tlm;
  1269	
  1270	static int tlm_fill_super(struct super_block *sb, void *data, int silent)
  1271	{
  1272		struct inode *root_inode;
  1273		struct dentry *root_dentry;
  1274		struct scmi_tlm_instance *ti;
  1275	
  1276		sb->s_magic = TLM_FS_MAGIC;
  1277		sb->s_op = &tlm_sops;
  1278	
  1279		/* create root inode (directory) */
  1280		root_inode = scmi_tlm_inode_initialize(sb, S_IFDIR | 0755, &root_tlm);
  1281		if (!root_inode)
  1282			return -ENOMEM;
  1283	
  1284		root_dentry = d_make_root(root_inode);
  1285		if (!root_dentry)
  1286			return -ENOMEM;
  1287	
  1288		sb->s_root = root_dentry;
  1289		list_for_each_entry(ti, &scmi_telemetry_instances, node) {
  1290			int ret;
  1291	
  1292			ret = scmi_telemetry_instance_register(sb, ti);
  1293			if (ret)
  1294				return ret;
  1295		}
  1296	
  1297		guard(mutex)(&scmi_tlm_mtx);
  1298		if (!scmi_tlm_sb)
  1299			scmi_tlm_sb = sb;
  1300	
  1301		return 0;
  1302	}
  1303	
  1304	static struct dentry *tlm_mount(struct file_system_type *fs_type, int flags,
  1305					const char *dev_name, void *data)
  1306	{
> 1307		return mount_nodev(fs_type, flags, data, tlm_fill_super);
  1308	}
  1309	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
