Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1D3126C0D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 20:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727209543; cv=none; b=VgzEt1hk70wlOT9h0LtQTYdJf+2lU7XJr3hTkkGstH7SN/4551V/Ksm+fUC3mzf2Zd+E4sAXoaItZ20PufF4ATYY+9nzipcYJmwhljMfzD7n/FhSI/4e3igSsIDE5WCe9QDYaqSQaKVcOELwsbsghul/DjFZfhHqxkINwAFJi7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727209543; c=relaxed/simple;
	bh=FZ8EjcFqpNyin2QmdzVpvd37GmeJtETDcFSxK4jeask=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BZHRVDYM6NAuEkT7NiUS9a7VYPFVZU8lbb5JOjZp/GirqWRc/urk4STbkCzbpMY7VEx07rOHVefPcmImrnqkac8minyBTXPdpVBBWNF5/7CeMerckZy+kZxacNMsZim/eW1QXp+wK4BElK1n52x48tH58i75FuSBulvC8fwjoG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kwPADgJT; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kwPADgJT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727209542; x=1758745542;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FZ8EjcFqpNyin2QmdzVpvd37GmeJtETDcFSxK4jeask=;
  b=kwPADgJTAEYZjzHNGIJEtbv470zp85ZWGVU3+op7X5szpqMQeLItehdN
   sADo1bpN9L7uslxBq1gTIr4XTVmla/zYpmffe50W/TjImSxj8RYDXtsYN
   R6gXPzRVe11S75Vbi21/87/Q1hTVSpJD3tBbHn5s8Pe/Lykik3w7GsImn
   ZPTxLxjsUwSTIi8ZefwwCIGcOZlN6DFU4+mkoOO7CEeoHuuKbwf0J60kN
   4LjYluGCaqBmyBJz5JeASnzNK9ieLApQCkFe2K6WROJl4D4ZsbzNL2zun
   24ry2bRh0uhVaha9Zvub0vLHPb057CLr3QKFB1SokqdRm94KDGuiRT5pQ
   g==;
X-CSE-ConnectionGUID: 1ffNsENlRUuTFdxzN3RkpQ==
X-CSE-MsgGUID: FdC+aHPWTkSevDh7AkPuxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="25743920"
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; 
   d="scan'208";a="25743920"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 13:25:41 -0700
X-CSE-ConnectionGUID: OuAAaSSFQEmm/OXB2gTiiA==
X-CSE-MsgGUID: AgO2+/5dQD68viPiEgyDyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; 
   d="scan'208";a="102300166"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Sep 2024 13:25:39 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stC6K-000IoD-2O;
	Tue, 24 Sep 2024 20:25:36 +0000
Date: Wed, 25 Sep 2024 04:25:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, xiongmengbiao <xiongmengbiao@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13559/14103]
 drivers/crypto/ccp/hygon/csv-dev.c:1009:5: warning: no previous prototype
 for function 'vpsp_do_cmd'
Message-ID: <202409250445.Ywn782u5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d25e57f47750555950b12145f98d5168319e6712
commit: 0195654dac59fc8953825bf947cd62040cc0c040 [13559/14103] drivers/crypto/ccp: remove multi-level pointers processing for vpsp
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240925/202409250445.Ywn782u5-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240925/202409250445.Ywn782u5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409250445.Ywn782u5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/crypto/ccp/hygon/csv-dev.c:942:5: warning: no previous prototype for function '__vpsp_do_cmd_locked' [-Wmissing-prototypes]
     942 | int __vpsp_do_cmd_locked(uint32_t vid, int cmd, void *data, int *psp_ret)
         |     ^
   drivers/crypto/ccp/hygon/csv-dev.c:942:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     942 | int __vpsp_do_cmd_locked(uint32_t vid, int cmd, void *data, int *psp_ret)
         | ^
         | static 
>> drivers/crypto/ccp/hygon/csv-dev.c:1009:5: warning: no previous prototype for function 'vpsp_do_cmd' [-Wmissing-prototypes]
    1009 | int vpsp_do_cmd(uint32_t vid, int cmd, void *data, int *psp_ret)
         |     ^
   drivers/crypto/ccp/hygon/csv-dev.c:1009:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1009 | int vpsp_do_cmd(uint32_t vid, int cmd, void *data, int *psp_ret)
         | ^
         | static 
   2 warnings generated.


vim +/vpsp_do_cmd +1009 drivers/crypto/ccp/hygon/csv-dev.c

  1008	
> 1009	int vpsp_do_cmd(uint32_t vid, int cmd, void *data, int *psp_ret)
  1010	{
  1011		int rc;
  1012		int mutex_enabled = READ_ONCE(hygon_psp_hooks.psp_mutex_enabled);
  1013	
  1014		if (is_vendor_hygon() && mutex_enabled) {
  1015			if (psp_mutex_lock_timeout(&hygon_psp_hooks.psp_misc->data_pg_aligned->mb_mutex,
  1016						PSP_MUTEX_TIMEOUT) != 1) {
  1017				return -EBUSY;
  1018			}
  1019		} else {
  1020			mutex_lock(hygon_psp_hooks.sev_cmd_mutex);
  1021		}
  1022	
  1023		rc = __vpsp_do_cmd_locked(vid, cmd, data, psp_ret);
  1024	
  1025		if (is_vendor_hygon() && mutex_enabled)
  1026			psp_mutex_unlock(&hygon_psp_hooks.psp_misc->data_pg_aligned->mb_mutex);
  1027		else
  1028			mutex_unlock(hygon_psp_hooks.sev_cmd_mutex);
  1029	
  1030		return rc;
  1031	}
  1032	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
