Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D1823C0
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Apr 2023 14:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681052075; x=1712588075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=35uxAroksEOnt59SsVOxai3uDW5pdmM4QnAH64E1cTY=;
  b=c7fGiPmk83bJ3CoJLEmjjW77WN5duPYTz7gdvc9OBTCbAxT43rTUIjCL
   YmUa3PYOj1nzOQmeOxyV5Hz5B1i5Kfszc8yXDwJm+LisI/0QDuuCeXFhT
   CbmEQNKOqvNiXCqm22+a0FmyxwI2WE4326yltEN7jjUOYF4TzYA575LPQ
   nUI5V/IZG031pnR1UNwV04kpUrkEz1WEKhxW4xo651gJgcBAOGLrD11ZI
   iWgKZwrsdKhxXGHZkuDYjp1fPD1djhUsDOt8EfXguwjbZQw5mK4E2G4kD
   1Szy/GwUGWCWLuNrFToAmR2MZStPjhjjOJPJ2I47EZHNzBJiuhO7nBzD7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="323591338"
X-IronPort-AV: E=Sophos;i="5.98,331,1673942400"; 
   d="scan'208";a="323591338"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2023 07:54:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="934115148"
X-IronPort-AV: E=Sophos;i="5.98,331,1673942400"; 
   d="scan'208";a="934115148"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 09 Apr 2023 07:54:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plWR5-000UZB-38;
	Sun, 09 Apr 2023 14:54:31 +0000
Date: Sun, 9 Apr 2023 22:53:44 +0800
From: kernel test robot <lkp@intel.com>
To: Navneet Singh <navneet.singh@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Ben Widawsky <ben.widawsky@intel.com>,
	Dan Williams <dan.j.williams@intel.com>
Subject: [cxl:for-6.5/dcd-preview 14/15] drivers/cxl/core/mbox.c:1439:31:
 sparse: sparse: incorrect type in initializer (different base types)
Message-ID: <202304092226.4c9plNY8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git for-6.5/dcd-preview
head:   f425bc34c600e2a3721d6560202962ec41622815
commit: d4d29ea64c09ae3049b0f5225c41460ea2a8e2a6 [14/15] cxl/mem : Add get dynamic capacity extent list mbox support
config: alpha-randconfig-s051-20230409 (https://download.01.org/0day-ci/archive/20230409/202304092226.4c9plNY8-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git/commit/?id=d4d29ea64c09ae3049b0f5225c41460ea2a8e2a6
        git remote add cxl https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git
        git fetch --no-tags cxl for-6.5/dcd-preview
        git checkout d4d29ea64c09ae3049b0f5225c41460ea2a8e2a6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha SHELL=/bin/bash drivers/cxl/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304092226.4c9plNY8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/cxl/core/mbox.c:1439:31: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] extent_cnt @@     got unsigned int cnt @@
   drivers/cxl/core/mbox.c:1439:31: sparse:     expected restricted __le32 [usertype] extent_cnt
   drivers/cxl/core/mbox.c:1439:31: sparse:     got unsigned int cnt
>> drivers/cxl/core/mbox.c:1440:39: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] start_extent_index @@     got unsigned int index @@
   drivers/cxl/core/mbox.c:1440:39: sparse:     expected restricted __le32 [usertype] start_extent_index
   drivers/cxl/core/mbox.c:1440:39: sparse:     got unsigned int index
   drivers/cxl/core/mbox.c:1536:18: sparse: sparse: cast to non-scalar
   drivers/cxl/core/mbox.c:1536:18: sparse: sparse: cast from non-scalar

vim +1439 drivers/cxl/core/mbox.c

  1414	
  1415	int cxl_dev_get_dc_extents(struct cxl_dev_state *cxlds,
  1416					unsigned int index, unsigned int cnt)
  1417	{
  1418		/* See CXL 3.0 Table 125 dynamic capacity config  Output Payload */
  1419		struct device *dev = cxlds->dev;
  1420		struct cxl_mbox_dc_extents *dc_extents;
  1421		struct cxl_mbox_get_dc_extent get_dc_extent;
  1422		unsigned int extent_gen_num, available_extents, total_extent_cnt;
  1423		int rc;
  1424		struct cxl_dc_extent_data *extent;
  1425		struct cxl_mbox_cmd mbox_cmd;
  1426		struct resource alloc_dpa_res;
  1427		struct cxl_mem_command *cmd =
  1428				cxl_mem_find_command(CXL_MBOX_OP_GET_DC_EXTENT_LIST);
  1429	
  1430		if (!test_bit(cmd->info.id, cxlds->enabled_cmds)) {
  1431			dev_dbg(dev, "unsupported cmd : get dyn cap extent list\n");
  1432			return 0;
  1433		}
  1434	
  1435		dc_extents = kvmalloc(cxlds->payload_size, GFP_KERNEL);
  1436		if (!dc_extents)
  1437			return -ENOMEM;
  1438		get_dc_extent = (struct cxl_mbox_get_dc_extent) {
> 1439			.extent_cnt = cnt,
> 1440			.start_extent_index = index,
  1441		};
  1442	
  1443		mbox_cmd = (struct cxl_mbox_cmd) {
  1444			.opcode = CXL_MBOX_OP_GET_DC_EXTENT_LIST,
  1445			.payload_in = &get_dc_extent,
  1446			.size_in = sizeof(get_dc_extent),
  1447			.size_out = cxlds->payload_size,
  1448			.payload_out = dc_extents,
  1449			.min_out = 1,
  1450		};
  1451		rc = cxl_internal_send_cmd(cxlds, &mbox_cmd);
  1452		if (rc < 0)
  1453			goto out;
  1454	
  1455		available_extents = le32_to_cpu(dc_extents->ret_extent_cnt);
  1456		total_extent_cnt = le32_to_cpu(dc_extents->total_extent_cnt);
  1457		extent_gen_num = le32_to_cpu(dc_extents->extent_list_num);
  1458		dev_dbg(dev, "No Total extent count :%d Extent list Generation Num:%d\n",
  1459				total_extent_cnt, extent_gen_num);
  1460	
  1461	
  1462		for (int i = 0; i < available_extents ; i++) {
  1463			extent = devm_kzalloc(dev, sizeof(*extent), GFP_KERNEL);
  1464			if (!extent) {
  1465				dev_err(dev, "No memory available\n");
  1466				rc = -ENOMEM;
  1467				goto out;
  1468			}
  1469			extent->dpa_start = le64_to_cpu(dc_extents->extent[i].start_dpa);
  1470			extent->length = le64_to_cpu(dc_extents->extent[i].length);
  1471			memcpy(extent->tag, dc_extents->extent[i].tag,
  1472						sizeof(dc_extents->extent[i].tag));
  1473			extent->shared_extent_seq =
  1474					le16_to_cpu(dc_extents->extent[i].shared_extn_seq);
  1475			dev_dbg(dev, "dynamic capacity extent[%d] DPA:0x%llx LEN:%llx\n",
  1476					i, extent->dpa_start, extent->length);
  1477	
  1478			alloc_dpa_res = (struct resource){
  1479				.start = extent->dpa_start,
  1480				.end = extent->dpa_start + extent->length - 1,
  1481			};
  1482	
  1483			rc = cxl_add_dc_extent(cxlds, &alloc_dpa_res);
  1484			if (rc < 0)
  1485				goto out;
  1486			rc = xa_insert(&cxlds->dc_extent_list, extent->dpa_start, extent,
  1487					GFP_KERNEL);
  1488		}
  1489	
  1490	out:
  1491		kvfree(dc_extents);
  1492		if (rc < 0)
  1493			return rc;
  1494	
  1495		return available_extents;
  1496	}
  1497	EXPORT_SYMBOL_NS_GPL(cxl_dev_get_dc_extents, CXL);
  1498	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
