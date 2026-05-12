Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70E339EB59
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 15:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778598455; cv=none; b=jkM4VVI5E7xfcITL7Z9X3ok+6vuRDO1ZXJBiflEqto8ZXabD3qs41HsjxmfGXz8IHIvigjqAWWTiOd7k5QCC3BWgZpHXcpaX2RKPSsG6dQfx5uDLYRbVuA3GBcPViCoYwsXvC8h9VeOAyqY4wGaiD/dSNUYBPr31n7DQu2Vip5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778598455; c=relaxed/simple;
	bh=ffDoXb0YC/0S9Oul7vmJPDt9KXYWWEH+LWQKnq5fZPg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qOWLjFeiaqWocv9HbBe6dKHUcfaltHH2/1rxckd6HW2seceAyr0cldlBi2vkcz1NAuLAaE0l19VeLRtVENqvIF9cmchY20EpNTbLNnqfW2++L2fMBnTfeBai8lkcNBRwiHXoJTvrbt8+z3h1TMDgg3DF2+PscZXWD4wgpsMeh1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZMdZsndL; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZMdZsndL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778598454; x=1810134454;
  h=date:from:to:cc:subject:message-id;
  bh=ffDoXb0YC/0S9Oul7vmJPDt9KXYWWEH+LWQKnq5fZPg=;
  b=ZMdZsndL76dLZWJweLUxXqlcrfTDwZ/sOvjW/8lSCSfeJ9KXz1/gIDyp
   1mB3mR8wuHDW9LnBUeoSd/BKfrCPTvnJQicb7OGauQYGlpGtKQ99gI7q1
   s1oCHKwN3gc5uQvoCKY7c3usysw1INi04zYInsc+h3daxR3yvgc1EZy+5
   5VtPPlYd+/W3L5M93LPXsDkYoZHJjWSIhVvZNres1oiiy6CKA/c1egCPz
   EJ3W5ku0sh0w2UvGwLbfDHH8Sha7l0ESF7rIMw1S71TfZImJkhIs2Ximp
   IhUmb3d89YjHPQw9vJg2NCFJjyOJ0meyRKJU84TMqghew4MI5pwPQadTH
   g==;
X-CSE-ConnectionGUID: BIvJZ5T/TteDRpnAEBHtNQ==
X-CSE-MsgGUID: uV3ApoSER6WOO8hDZDu/vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="97076173"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="97076173"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 08:07:28 -0700
X-CSE-ConnectionGUID: WN/TqzaCQu+llZXdqnEa8A==
X-CSE-MsgGUID: 9AvIe12fS62EjpTHj3gnzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="236933504"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 12 May 2026 08:07:27 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMohg-000000008I1-2XUB;
	Tue, 12 May 2026 15:07:24 +0000
Date: Tue, 12 May 2026 17:06:42 +0200
From: kernel test robot <lkp@intel.com>
To: Leon Hwang <leon.hwang@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: kernel/bpf/syscall.c:1655:1: warning: label 'free' defined
 but not used
Message-ID: <202605121634.Ts7b4pvS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Leon-Hwang/bpf-Extend-BPF-syscall-with-common-attributes-support/20260512-141718
head:   cf666930ba205510468d7879922c1237df7292c9
commit: 7cab8e74b4f11d29c3c1bc065fbdfc54b04ac102 bpf: Add syscall common attributes support for map_create
date:   9 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260512/202605121634.Ts7b4pvS-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605121634.Ts7b4pvS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605121634.Ts7b4pvS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/syscall.c: In function 'map_create':
>> kernel/bpf/syscall.c:1655:1: warning: label 'free' defined but not used [-Wunused-label]
    1655 | free:
         | ^~~~


vim +/free +1655 kernel/bpf/syscall.c

  1634	
  1635	static int map_create(union bpf_attr *attr, bpfptr_t uattr, struct bpf_common_attr *attr_common,
  1636			      bpfptr_t uattr_common, u32 size_common)
  1637	{
  1638		struct bpf_verifier_log *log;
  1639		struct bpf_log_attr attr_log;
  1640		int err, ret;
  1641	
  1642		log = bpf_log_attr_create_vlog(&attr_log, attr_common, uattr_common, size_common);
  1643		if (IS_ERR(log))
  1644			return PTR_ERR(log);
  1645	
  1646		err = __map_create(attr, uattr, log);
  1647	
  1648		ret = bpf_log_attr_finalize(&attr_log, log);
  1649		if (ret) {
  1650			if (err >= 0)
  1651				close_fd(err);
  1652			err = ret;
  1653		}
  1654	
> 1655	free:
  1656		kfree(log);
  1657		return err;
  1658	}
  1659	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
