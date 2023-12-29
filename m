Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F275912B66
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Dec 2023 17:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kfVopb/m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703872739; x=1735408739;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/4a05JRnrxluO84KeqgffcbEQM5dhEz1rdnt87ArK+I=;
  b=kfVopb/m3YSHce6SMi72JRV+G8CSX5ytfnl4vNen5KZDNx+NC4y2UYgu
   IfMFvuN0sHJaOthnuDVB4IhomBxLLH2rPpm6EbxUNsayR5+DPDs0VGPKw
   nnZBtDACcj/kcxRFqtpm47+D4r/5Pc7z8EwpowrQyKHE6fYVnYmJqLgik
   F9niXiF2E/p7P8V/IyqjMUPwFt3WcFPkHAblDlqrXvgDr5FKjXKOjlu+E
   1oYavTkTd1ZsqlHyYCbEOUzfcxuq/xSMConoZFy7iRpZOwXDasaGmpT8E
   6CqEC3lUl4Sv1bh5bolJ7U0CjaXM5Nq0IXUfIY0RMVbqV1dvH1RNYsR54
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="460981045"
X-IronPort-AV: E=Sophos;i="6.04,315,1695711600"; 
   d="scan'208";a="460981045"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2023 09:58:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="897568097"
X-IronPort-AV: E=Sophos;i="6.04,315,1695711600"; 
   d="scan'208";a="897568097"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 29 Dec 2023 09:58:50 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJH8C-000HeT-1D;
	Fri, 29 Dec 2023 17:58:48 +0000
Date: Sat, 30 Dec 2023 01:58:23 +0800
From: kernel test robot <lkp@intel.com>
To: Kaixu Xia <kaixuxia@tencent.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: net/netfilter/nf_conntrack_standalone.c:374:9: warning: ISO C90
 forbids mixed declarations and code
Message-ID: <202312300149.lwjCSO6m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: db890618cee071d820bb334a9a86ac76a1c27f2b nf_conntrack: add tencent cloud vpcid vmip extend
date:   2 years, 9 months ago
config: x86_64-oc_base_config (https://download.01.org/0day-ci/archive/20231230/202312300149.lwjCSO6m-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231230/202312300149.lwjCSO6m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312300149.lwjCSO6m-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/netfilter/nf_conntrack_standalone.c: In function 'ct_seq_show':
>> net/netfilter/nf_conntrack_standalone.c:374:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     374 |         void (*ct_get_vmip_vpcid_tmp)(const struct nf_conn *ct, __be32 *vmip, u32 *vpcid) = ct_get_vmip_vpcid;
         |         ^~~~


vim +374 net/netfilter/nf_conntrack_standalone.c

   369	
   370		ct_show_secctx(s, ct);
   371		ct_show_zone(s, ct, NF_CT_DEFAULT_ZONE_DIR);
   372		ct_show_delta_time(s, ct);
   373	
 > 374		void (*ct_get_vmip_vpcid_tmp)(const struct nf_conn *ct, __be32 *vmip, u32 *vpcid) = ct_get_vmip_vpcid;
   375		if(ct_get_vmip_vpcid_tmp) {
   376			__be32 vmip = 0;
   377			u32 vpcid = 0;
   378			ct_get_vmip_vpcid_tmp(ct, &vmip, &vpcid);
   379			seq_printf(s, "vpcid=%u ", vpcid);
   380			seq_printf(s, "vmip=%pI4 ", &vmip);
   381		}
   382	
   383		seq_printf(s, "use=%u\n", atomic_read(&ct->ct_general.use));
   384	
   385		if (seq_has_overflowed(s))
   386			goto release;
   387	
   388		ret = 0;
   389	release:
   390		nf_ct_put(ct);
   391		return ret;
   392	}
   393	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
