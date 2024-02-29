Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31FE14A0B6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Feb 2024 15:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709221592; cv=none; b=kcQQ4L74cmrsE9ylxLXkzi+QxamnT/8Hy6z2Y+LZ3prTYgLPL7s1UlKCFDz6lF9vLTTmobw41vtkWogeYpyz7NFe1keTA6ZFUvQI2Y/uP9nnwvVwUc0PGv5SbcmuGmdSEl/+C2xrjWw0abNRMY3//S6i4ohV/J37vyNwrkbUmWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709221592; c=relaxed/simple;
	bh=TQF/HSNGDWUdS/233MWiAevx+8tIowRqGy5lYGOm7X4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z/u1oSQ/qPmaQcvu9WltjI0XJLhn8YWK1xkRhhAvlWR+DxiYFac8ElElUkiOFxAk6yc59lU08Nvo+QlxxGEjnI4CpJB/IlT2w4orzY7E12IMoEiz/0THqtvjyWq3mvazpwy0B1jzEVr9hZWc6SyhgqiEuvQWcNyZqAH/zq2oqeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m1KHLExA; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m1KHLExA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709221591; x=1740757591;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TQF/HSNGDWUdS/233MWiAevx+8tIowRqGy5lYGOm7X4=;
  b=m1KHLExAdFsUVT+Lm3tpkn8ENLaIOhlA02HzO+zacut7vsDaBitTa6uz
   Kz4f5BxueNSjCYYJgYmRUXR1wJeK5qvTmP07a9rBnJ7vcfg2sU94o6DkJ
   HD1p0RidXG/4ATrij4lu5s9GjOCv6/ipwLaixf05QNPYA8raKX87hhZlj
   mHQ5+e1aYtErejXLjx6NebmQHOI8rIV8Edo+SYQGylyDAMJ2AUdpUqW0e
   Upm2tpxMxEjF+lQhOqViVE1O0Zo7nFnMxkvbKxNjUbLU5fN5ZngyqZ4Ye
   i44RRkeYhTEyB1JzIQvLI6SrbGGbK/WNaKvgClE8ioT5C4DXEe5EXtfl1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="21242737"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="21242737"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 07:46:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="38884397"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 29 Feb 2024 07:46:29 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfic6-000D2h-18;
	Thu, 29 Feb 2024 15:46:26 +0000
Date: Thu, 29 Feb 2024 23:44:56 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 14909/21656]
 drivers/net/ethernet/hisilicon/hns3/hnae3.h:721:26: warning: array subscript
 'struct hclge_reset_cmd[0]' is partly outside array bounds of 'struct
 hclge_desc[1]'
Message-ID: <202402292301.Zc2bmew3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a828e118f71b941479af277bc6aade0094fc62fe
commit: 729f96a4e0c32f1c1bfa60e4ff485aa91890963d [14909/21656] net: hns3: optimize the process of queue reset
config: arm64-randconfig-001-20240228 (https://download.01.org/0day-ci/archive/20240229/202402292301.Zc2bmew3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240229/202402292301.Zc2bmew3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402292301.Zc2bmew3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3345:5: warning: no previous prototype for 'hclge_set_all_vf_rst' [-Wmissing-prototypes]
    3345 | int hclge_set_all_vf_rst(struct hclge_dev *hdev, bool reset)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:9556:5: warning: no previous prototype for 'hclge_reset_tqp_cmd' [-Wmissing-prototypes]
    9556 | int hclge_reset_tqp_cmd(struct hnae3_handle *handle)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:9603:5: warning: no previous prototype for 'hclge_reset_rcb' [-Wmissing-prototypes]
    9603 | int hclge_reset_rcb(struct hnae3_handle *handle)
         |     ^~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:11699:5: warning: no previous prototype for 'hclge_init' [-Wmissing-prototypes]
   11699 | int hclge_init(void)
         |     ^~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c: In function 'hclge_get_strings':
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:668:50: warning: '%s' directive output may be truncated writing up to 3359 bytes into a region of size 32 [-Wformat-truncation=]
     668 |                 snprintf(buff, ETH_GSTRING_LEN, "%s", strs[i].desc);
         |                                                  ^~
   In function 'hclge_comm_get_strings',
       inlined from 'hclge_get_strings' at drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:774:7:
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:668:17: note: 'snprintf' output between 1 and 3360 bytes into a destination of size 32
     668 |                 snprintf(buff, ETH_GSTRING_LEN, "%s", strs[i].desc);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_cmd.h:9,
                    from drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:18:
   In function 'hclge_func_reset_cmd',
       inlined from 'hclge_reset_prepare_wait' at drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3608:9:
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3467:26: warning: array subscript 'struct hclge_reset_cmd[0]' is partly outside array bounds of 'struct hclge_desc[1]' [-Warray-bounds=]
    3467 |         hnae3_set_bit(req->mac_func_reset, HCLGE_CFG_RESET_FUNC_B, 1);
   drivers/net/ethernet/hisilicon/hns3/hnae3.h:720:18: note: in definition of macro 'hnae3_set_field'
     720 |                 (origin) &= (~(mask)); \
         |                  ^~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3467:9: note: in expansion of macro 'hnae3_set_bit'
    3467 |         hnae3_set_bit(req->mac_func_reset, HCLGE_CFG_RESET_FUNC_B, 1);
         |         ^~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c: In function 'hclge_reset_prepare_wait':
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3462:27: note: at offset 8 into object 'desc' of size 32
    3462 |         struct hclge_desc desc;
         |                           ^~~~
   In function 'hclge_func_reset_cmd',
       inlined from 'hclge_reset_prepare_wait' at drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3608:9:
>> drivers/net/ethernet/hisilicon/hns3/hnae3.h:721:26: warning: array subscript 'struct hclge_reset_cmd[0]' is partly outside array bounds of 'struct hclge_desc[1]' [-Warray-bounds=]
     721 |                 (origin) |= ((val) << (shift)) & (mask); \
         |                 ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hnae3.h:726:9: note: in expansion of macro 'hnae3_set_field'
     726 |         hnae3_set_field((origin), (0x1 << (shift)), (shift), (val))
         |         ^~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3467:9: note: in expansion of macro 'hnae3_set_bit'
    3467 |         hnae3_set_bit(req->mac_func_reset, HCLGE_CFG_RESET_FUNC_B, 1);
         |         ^~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c: In function 'hclge_reset_prepare_wait':
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3462:27: note: at offset 8 into object 'desc' of size 32
    3462 |         struct hclge_desc desc;
         |                           ^~~~
   In function 'hclge_func_reset_cmd',
       inlined from 'hclge_reset_prepare_wait' at drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3608:9:
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3468:29: warning: array subscript 'struct hclge_reset_cmd[0]' is partly outside array bounds of 'struct hclge_desc[1]' [-Warray-bounds=]
    3468 |         req->fun_reset_vfid = func_id;
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c: In function 'hclge_reset_prepare_wait':
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3462:27: note: at offset 8 into object 'desc' of size 32
    3462 |         struct hclge_desc desc;
         |                           ^~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c: In function 'hclge_func_reset_cmd':
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3467:26: warning: array subscript 'struct hclge_reset_cmd[0]' is partly outside array bounds of 'struct hclge_desc[1]' [-Warray-bounds=]
    3467 |         hnae3_set_bit(req->mac_func_reset, HCLGE_CFG_RESET_FUNC_B, 1);
         |                          ^~
   drivers/net/ethernet/hisilicon/hns3/hnae3.h:720:18: note: in definition of macro 'hnae3_set_field'
     720 |                 (origin) &= (~(mask)); \
         |                  ^~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3467:9: note: in expansion of macro 'hnae3_set_bit'
    3467 |         hnae3_set_bit(req->mac_func_reset, HCLGE_CFG_RESET_FUNC_B, 1);
         |         ^~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3462:27: note: at offset 8 into object 'desc' of size 32
    3462 |         struct hclge_desc desc;
         |                           ^~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3467:26: warning: array subscript 'struct hclge_reset_cmd[0]' is partly outside array bounds of 'struct hclge_desc[1]' [-Warray-bounds=]
    3467 |         hnae3_set_bit(req->mac_func_reset, HCLGE_CFG_RESET_FUNC_B, 1);
         |                          ^~
   drivers/net/ethernet/hisilicon/hns3/hnae3.h:721:18: note: in definition of macro 'hnae3_set_field'
     721 |                 (origin) |= ((val) << (shift)) & (mask); \
         |                  ^~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3467:9: note: in expansion of macro 'hnae3_set_bit'
    3467 |         hnae3_set_bit(req->mac_func_reset, HCLGE_CFG_RESET_FUNC_B, 1);
         |         ^~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3462:27: note: at offset 8 into object 'desc' of size 32
    3462 |         struct hclge_desc desc;
         |                           ^~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3468:12: warning: array subscript 'struct hclge_reset_cmd[0]' is partly outside array bounds of 'struct hclge_desc[1]' [-Warray-bounds=]
    3468 |         req->fun_reset_vfid = func_id;
         |            ^~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3462:27: note: at offset 8 into object 'desc' of size 32
    3462 |         struct hclge_desc desc;
         |                           ^~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c: In function 'hclge_reset_rcb':
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:9619:26: warning: array subscript 'struct hclge_reset_cmd[0]' is partly outside array bounds of 'struct hclge_desc[1]' [-Warray-bounds=]
    9619 |         hnae3_set_bit(req->fun_reset_rcb, HCLGE_CFG_RESET_RCB_B, 1);
         |                          ^~
   drivers/net/ethernet/hisilicon/hns3/hnae3.h:720:18: note: in definition of macro 'hnae3_set_field'
     720 |                 (origin) &= (~(mask)); \
         |                  ^~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:9619:9: note: in expansion of macro 'hnae3_set_bit'
    9619 |         hnae3_set_bit(req->fun_reset_rcb, HCLGE_CFG_RESET_RCB_B, 1);
         |         ^~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:9610:27: note: at offset 8 into object 'desc' of size 32
    9610 |         struct hclge_desc desc;
         |                           ^~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:9619:26: warning: array subscript 'struct hclge_reset_cmd[0]' is partly outside array bounds of 'struct hclge_desc[1]' [-Warray-bounds=]
    9619 |         hnae3_set_bit(req->fun_reset_rcb, HCLGE_CFG_RESET_RCB_B, 1);
         |                          ^~
   drivers/net/ethernet/hisilicon/hns3/hnae3.h:721:18: note: in definition of macro 'hnae3_set_field'
     721 |                 (origin) |= ((val) << (shift)) & (mask); \
         |                  ^~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:9619:9: note: in expansion of macro 'hnae3_set_bit'
    9619 |         hnae3_set_bit(req->fun_reset_rcb, HCLGE_CFG_RESET_RCB_B, 1);
         |         ^~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:9610:27: note: at offset 8 into object 'desc' of size 32
    9610 |         struct hclge_desc desc;
         |                           ^~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:9620:12: warning: array subscript 'struct hclge_reset_cmd[0]' is partly outside array bounds of 'struct hclge_desc[1]' [-Warray-bounds=]
    9620 |         req->fun_reset_rcb_vqid_start = cpu_to_le16(queue_gid);
         |            ^~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:9610:27: note: at offset 8 into object 'desc' of size 32
    9610 |         struct hclge_desc desc;
         |                           ^~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:9621:12: warning: array subscript 'struct hclge_reset_cmd[0]' is partly outside array bounds of 'struct hclge_desc[1]' [-Warray-bounds=]
    9621 |         req->fun_reset_rcb_vqid_num = cpu_to_le16(handle->kinfo.num_tqps);
         |            ^~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:9610:27: note: at offset 8 into object 'desc' of size 32
    9610 |         struct hclge_desc desc;
         |                           ^~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:9630:28: warning: array subscript 'struct hclge_reset_cmd[0]' is partly outside array bounds of 'struct hclge_desc[1]' [-Warray-bounds=]
    9630 |         return_status = req->fun_reset_rcb_return_status;
         |                            ^~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:9610:27: note: at offset 8 into object 'desc' of size 32
    9610 |         struct hclge_desc desc;
         |                           ^~~~


vim +721 drivers/net/ethernet/hisilicon/hns3/hnae3.h

38caee9d3ee8b32 Salil   2017-08-02  717  
e4e87715aa850ab Peng Li 2018-07-02  718  #define hnae3_set_field(origin, mask, shift, val) \
38caee9d3ee8b32 Salil   2017-08-02  719  	do { \
38caee9d3ee8b32 Salil   2017-08-02  720  		(origin) &= (~(mask)); \
38caee9d3ee8b32 Salil   2017-08-02 @721  		(origin) |= ((val) << (shift)) & (mask); \
38caee9d3ee8b32 Salil   2017-08-02  722  	} while (0)
e4e87715aa850ab Peng Li 2018-07-02  723  #define hnae3_get_field(origin, mask, shift) (((origin) & (mask)) >> (shift))
38caee9d3ee8b32 Salil   2017-08-02  724  

:::::: The code at line 721 was first introduced by commit
:::::: 38caee9d3ee8b32b36912f54e19438eddd126772 net: hns3: Add support of the HNAE3 framework

:::::: TO: Salil <salil.mehta@huawei.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
