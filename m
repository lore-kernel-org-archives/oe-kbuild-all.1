Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3786D12E40
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Feb 2024 03:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708574065; cv=none; b=e6r6HXNa3uZezpnVpERO7qrq7Vy0x7lvNQOSY83uca5BXG/LqJtiu98fEZTBUeYMR4zmyOqKiQtBsLzSlsyq7TwrjbyGE6uIX5Nhmze/M6D0dbIasUTuRub1cRtxzMr1sqyY0mUm1ClBthfRXiBmjde7rhFXg+IUW+sGxRZMIqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708574065; c=relaxed/simple;
	bh=HUZPfem4IEc6s57RJcBYNCmq1traNMhzr+8lPHNmseg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I9an6WcVEoLfCXQCouljqNmzoV+h/CKz0GKOHZhrfC1JZqW0qanXhfbBxKkqoObUwZcBxMmGRhHp1QMXKI/q2E0n93eL+94G+rv0I3V/IvOL0SJ0x9wQV79g0EMsIvqQc1zlf6fJX9hJcTLzvQPRATCsO7FAn51QM01/pOEmuoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FqGr4eZw; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FqGr4eZw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708574063; x=1740110063;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HUZPfem4IEc6s57RJcBYNCmq1traNMhzr+8lPHNmseg=;
  b=FqGr4eZwriMGyESG8U6t+SAWg7nS5KYhUrk9VyGphXox9Z4AYWQNjE+b
   EDoqZbqmIMqLZ02XxQonIV1+aKl9+3ycb7wLLkS0Fch1ijSTQkZQDRznB
   iqoQP+htjIWlateaIZaST+2uauwG+rXPc0KjmO7fkDvp6GaWfnhEpbVzF
   VJxJwMqWEmhCw4s42LwNk5jDl3QLRlTEVv+czIpNMV1GSfDgTOcpIgJ5V
   t5GlFZJ0jdajbL3CpqFLxeW3j7Pv7U/vfh7O+Z5B/3yu4PBnsz8dsy7d+
   UpbMXoK3WaTVRtJ2nvgNn3SZXNGXkxWkQArCjUXh29LQsV7RJSDKr00RV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="6554516"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="6554516"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 19:54:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="5301643"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 21 Feb 2024 19:54:20 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rd0A5-0005xt-2a;
	Thu, 22 Feb 2024 03:54:17 +0000
Date: Thu, 22 Feb 2024 11:50:56 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: net/netfilter/nf_conntrack_standalone.c:374:9: warning: mixing
 declarations and code is a C99 extension
Message-ID: <202402221127.P8hLHYSy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kaixu,

FYI, the error/warning still remains.

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: db890618cee071d820bb334a9a86ac76a1c27f2b nf_conntrack: add tencent cloud vpcid vmip extend
date:   2 years, 11 months ago
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240222/202402221127.P8hLHYSy-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402221127.P8hLHYSy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402221127.P8hLHYSy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/netfilter/nf_conntrack_standalone.c:374:9: warning: mixing declarations and code is a C99 extension [-Wdeclaration-after-statement]
     374 |         void (*ct_get_vmip_vpcid_tmp)(const struct nf_conn *ct, __be32 *vmip, u32 *vpcid) = ct_get_vmip_vpcid;
         |                ^
   1 warning generated.


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
