Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2CB3C276D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Aug 2026 19:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785611991; cv=none; b=nZ/BbSEYRKdKRYBLXB89c1s/tIRWA9a6lvWtzEyG43JntiQPO6n0IqvlSHrmZLLzXqOOM8g6BHJgaubk8kG3vWazxnQCo357jT0PV+E0YellhFAY3w2lID9rwrJL04vzztPTB48gz9Ufo60P8JGsZGmUEYfl5jF+MAkZQKDG2Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785611991; c=relaxed/simple;
	bh=DMLCu9U53zkc0tdWxLamIX0+4cLgaxWbZICbUyl+50w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t4o2kwgEusMFxXpzE6vg+oqjhlqxApNxDnJByyrAACSjDosOVByg7CEXTicirI4TSGIzgTl2sFF5TGTvnky0zwkzgYPzBuMbAhaxxaYuEuPLnUOln8KsiewLnqKk0FDvnitmpMPY49zubusnqyfu4f5hMGiDDpadb3cCsAZuS3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XnABDTg0; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XnABDTg0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785611988; x=1817147988;
  h=date:from:to:cc:subject:message-id;
  bh=DMLCu9U53zkc0tdWxLamIX0+4cLgaxWbZICbUyl+50w=;
  b=XnABDTg0BZFr5NHbu5jzoMLaXKM61APFkQtm1gQdfjv/nXxO9uFLj1he
   sRLZrw+9Pm+D26sQOii3nWPj4c8v8D1uYyIFQeSxwLLCm4i66YhWXeSWk
   KYyIDe+A8VfJlZu/yXcGehK57sPo92TNMxqub1azbTpR+GmLumMG9p7NA
   eJ3a/Vwxx9cY8h52ejz6rwn4inE4JJd30RkDNmyXTsWVy4IpKqPVdFRjh
   2nCVC3NSHo/QrfusQu8MtDAsivgKuE4QrIRmqM7MAIcPyzwRlAho2PBOW
   Chac2GYtP76uKykmBBdspJOHhJ8+ce4z6YkoT1MA+Ivg3hkUNejfayphJ
   g==;
X-CSE-ConnectionGUID: k42we/I8TiSjU7kZ9u5SeQ==
X-CSE-MsgGUID: qbdjPO9sRDq/3mYgKzdhGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11862"; a="73746692"
X-IronPort-AV: E=Sophos;i="6.25,199,1779174000"; 
   d="scan'208";a="73746692"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 12:19:47 -0700
X-CSE-ConnectionGUID: aZTzqY/oRL2oM0q2hY9Hkg==
X-CSE-MsgGUID: xJcpnqCGT+q37lSjBSyE7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,199,1779174000"; 
   d="scan'208";a="262822365"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 Aug 2026 12:19:46 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqFFH-000000003ob-3G6W;
	Sat, 01 Aug 2026 19:19:43 +0000
Date: Sun, 02 Aug 2026 03:19:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Mattson <jmattson@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Sean Christopherson <seanjc@google.com>, Chao Gao <chao.gao@intel.com>
Subject: [sean-jc:x86/vmcs12_pages_leak 98/117] ERROR: modpost:
 "__udivdi3" [arch/x86/kvm/kvm-intel.ko] undefined!
Message-ID: <202608020328.K7oiDpiB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/vmcs12_pages_leak
head:   29a9ef5c329245cfbe69e75b69bf95013dc0e1a2
commit: 20b9ec6b4aa8ea9097c009c0d750df16f382f82a [98/117] KVM: VMX: Cap VMX preemption timer to work around Intel erratum
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260802/202608020328.K7oiDpiB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260802/202608020328.K7oiDpiB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608020328.K7oiDpiB-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [arch/x86/kvm/kvm-intel.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
