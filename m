Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20023914FF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 16:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785430122; cv=none; b=Z7jaLmoBJJ0medSPpwIgk0rfKeEdkbBMdQHSC2YbnkNLpEDvZrDMWgXpSdA0Z9EZSGC+VahVl4pS5a/yI7QdqUXZSOtzr+aPS2LPDTnKN8jxXaoK6ScPweKjDv6rAcdQxLVsj/wtQpYWzfgcp0aYeHudb/1zaSyUVZ++CtKKyfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785430122; c=relaxed/simple;
	bh=PX/q65DcMbGvu0ObmQKL4hFS2pOetUfR7QGcvC93DUs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S/A+ydQh3UMbXmL1gt/1dbXpMQl29vPzb9SnwdDD1r7BwPc3pe+eG6sQHu73mRkXRFVh0PCYbQrx0gA7fjn1TQX2f2p4h90RtrBck4Wx5BXFnVp3tI1GODhJmA/eEL/ugPs8YBsPcuKqt1wl14XpF/CrR0I0jZ5BT+23+0B0Idg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eq4NErd1; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eq4NErd1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785430120; x=1816966120;
  h=date:from:to:cc:subject:message-id;
  bh=PX/q65DcMbGvu0ObmQKL4hFS2pOetUfR7QGcvC93DUs=;
  b=eq4NErd1RwggPoxvv/BR6MRsQjQUMYalhHR4E/xqXGy2pnNIxg37susy
   TkNRQOhqRo+0I7yNakNgkEJMNFmmeKdL9u9HOPF3WPmAVnuPzh2fMwaZ/
   8/05YDZdNG2WCRrEUhCAptJUHYF9l4BbcI5cIK2bEHmdUD2iLgRoiEdUs
   s2a5MxRnH7WXidmdyInlIW10QuTPTk+kK8/PWPCyAJy2N/s1NsxU0wIru
   6TX1z1Zwd1iF5HcxR5Zo5XwifApEUToBQElSaiMktvOwznq4f9NpWHwxH
   TImFjOQkGzNfl5mUq1NcTFNlvPtKWI3YOpx77gtWTSMzhxe+tOo1C7Vz0
   A==;
X-CSE-ConnectionGUID: TGSRjoHKTzq6E1EDcPIiGA==
X-CSE-MsgGUID: ykgFZkUwThCN2DJ32xn4BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="96641001"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="96641001"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 09:48:39 -0700
X-CSE-ConnectionGUID: Z+fOG+a9QguOf2JSahrZ3w==
X-CSE-MsgGUID: 93jgKzdyRPq4DFjOvpjgTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="256045295"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 30 Jul 2026 09:48:38 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpTvw-000000002Pa-0wzA;
	Thu, 30 Jul 2026 16:48:36 +0000
Date: Thu, 30 Jul 2026 18:48:18 +0200
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:doe-7.2-rc1-wip 7/21] drivers/pci/pcie/aer.c:987:3:
 error: member reference base type 'char' is not a structure or union
Message-ID: <202607301819.PnBnoMP9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/l1k/linux doe-7.2-rc1-wip
head:   3ff494368f930bbd2364d93688549fcbd02a3881
commit: 7dde1844d2677e5a1c1f086d6f91294255ff571a [7/21] PCI/AER: Prettify error source logging
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260730/202607301819.PnBnoMP9-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607301819.PnBnoMP9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607301819.PnBnoMP9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/pcie/aer.c:987:3: error: member reference base type 'char' is not a structure or union
     987 |                 aer_printk(dev, "%s Bus Error: severity=%s (Inaccessible)\n",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     988 |                            bus_type, aer_error_severity_string[info->severity]);
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/pcie/aer.c:42:27: note: expanded from macro 'aer_printk'
      42 |         dev_printk(level, &(pdev)->dev, fmt, ##arg)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:129:22: note: expanded from macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                    ^~~
   1 error generated.


vim +/char +987 drivers/pci/pcie/aer.c

   961	
   962	void aer_print_error(struct aer_err_info *info, int i)
   963	{
   964		struct pci_dev *dev;
   965		const char *level = info->level;
   966		const char *bus_type = aer_err_bus(info);
   967	
   968		if (WARN_ON_ONCE(i >= AER_MAX_MULTI_ERR_DEVICES))
   969			return;
   970	
   971		dev = info->dev[i];
   972	
   973		pci_dev_aer_stats_incr(dev, info);
   974		trace_aer_event(pci_name(dev), (info->status & ~info->mask),
   975				info->severity, info->tlp_header_valid &&
   976				info->severity != AER_CORRECTABLE, &info->tlp,
   977				bus_type);
   978	
   979		/*
   980		 * For Advisory Non-Fatal Errors, record statistics and tracing
   981		 * even if ratelimited
   982		 */
   983		if (!info->ratelimit_print[i])
   984			goto anfe;
   985	
   986		if (!info->status) {
 > 987			aer_printk(dev, "%s Bus Error: severity=%s (Inaccessible)\n",
   988				   bus_type, aer_error_severity_string[info->severity]);
   989			return;
   990		}
   991	
   992		aer_printk(level, dev, "%s Bus Error: severity=%s\n",
   993			   bus_type, aer_error_severity_string[info->severity]);
   994	
   995		aer_printk(level, dev, "  device [%04x:%04x] error status/mask=%08x/%08x\n",
   996			   dev->vendor, dev->device, info->status, info->mask);
   997	
   998		__aer_print_error(dev, info);
   999	
  1000		if (info->tlp_header_valid && info->severity != AER_CORRECTABLE)
  1001			pcie_print_tlp_log(dev, &info->tlp, level, dev_fmt("  "));
  1002	
  1003	anfe:
  1004		/* Recursive invocation for Advisory Non-Fatal Errors */
  1005		if (info->anfe_status && info->severity == AER_CORRECTABLE) {
  1006			info->severity = AER_NONFATAL;
  1007			info->status = info->anfe_status;
  1008			info->mask = 0;
  1009	
  1010			aer_print_error(info, i);
  1011	
  1012			info->severity = AER_CORRECTABLE;
  1013		}
  1014	}
  1015	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
