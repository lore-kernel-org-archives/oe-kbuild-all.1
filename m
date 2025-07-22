Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B078D289344
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 05:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753162819; cv=none; b=XGR58CBqFA78FKsGGaKeamxXJxBXDHyiW2Y5dlWc2mCBWvRwf6jKVlSBBWGQUgDYlG+eQuWGKdkJKGrglwsgZAZsriYk3ztIqlEMv+ZU/XHuCipNv0HXum1GKLo0Zhyt17U2UC4FUa8bvHA7pPEioD/EMRWUkpjN3SQ9ubX+OxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753162819; c=relaxed/simple;
	bh=aHaFUzUplyG+j3mZMIGs5j8YNRmQHf4F7vC+SqugNx0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r5ww8ndD9NG1UfpIzVM6Ux9+TxvzaHIYJrG1B2rdPzChkGd+xTqYLDcaV6KOddIK6Z2DYPkUvKBTf4GGBhdFEWMHPB/QCVyqYb1XGkkICS1dy3IVcXJ71L5OT0fUa84vKZogcmzScNA+N8sqBf3Z9Ibt2GocqLO5ArRjoWlJG3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sjw8mezp; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sjw8mezp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753162818; x=1784698818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aHaFUzUplyG+j3mZMIGs5j8YNRmQHf4F7vC+SqugNx0=;
  b=Sjw8mezpfc/5V2zJXaFiK7NqEe9CDIWeKrQRrezeP1ev3DyNdFVGcmeo
   xeFLbGcKNLFioSERZqABVrI8QMRF7WFlhvYWFF9Eku35D53Y9MHOoVh20
   gCNeo0G2zv+I02Y5+CqSp4kObNdPA4krU1m6wQUuZWiitKfB2Le2cQv3f
   Q/CbfRhfnwn8bkHlZmznUCrVFYLrVj2zdHWS8uiP6IOKqhrdtXMWOaPu6
   2vVnlkR5QiYROkU/uab0a9sEz1ZKkpurUjsrARdkbnI0G7TXh83sAbIds
   IPPlpmNQ/SouWqGzvobbD+pq3wm7bmwTMwkKKgN7gyfs5kzXEsB8fgY93
   w==;
X-CSE-ConnectionGUID: Bk53QFirTzO4hwJX7APfMQ==
X-CSE-MsgGUID: +wwB6/MhS4uK81EY10ZtEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="65963160"
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="65963160"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 22:40:15 -0700
X-CSE-ConnectionGUID: sRa6atA7QfeCu5wFc25mpw==
X-CSE-MsgGUID: OkulabV6RfGTRGnDyutjDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="164521566"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Jul 2025 22:40:14 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ue5jX-000HUj-20;
	Tue, 22 Jul 2025 05:40:11 +0000
Date: Tue, 22 Jul 2025 13:39:40 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:rev/map_gmem 21/21] kismet: WARNING: unmet direct
 dependencies detected for KVM_GENERIC_MEMORY_ATTRIBUTES when selected by
 KVM_SW_PROTECTED_VM
Message-ID: <202507221346.sLto4oW8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux rev/map_gmem
head:   de34629939d7e68a429ea9f96e6a96ea4d46dd9d
commit: d7309d0e5d4d02c0fbb83488623bcfbe71f0be38 [21/21] tmp
config: x86_64-kismet-CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES-CONFIG_KVM_SW_PROTECTED_VM-0-0 (https://download.01.org/0day-ci/archive/20250722/202507221346.sLto4oW8-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250722/202507221346.sLto4oW8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507221346.sLto4oW8-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for KVM_GENERIC_MEMORY_ATTRIBUTES when selected by KVM_SW_PROTECTED_VM
   WARNING: unmet direct dependencies detected for KVM_GENERIC_MEMORY_ATTRIBUTES
     Depends on [n]: KVM_GENERIC_MMU_NOTIFIER [=n]
     Selected by [y]:
     - KVM_SW_PROTECTED_VM [=y] && VIRTUALIZATION [=y] && EXPERT [=y] && KVM [=y] && X86_64 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
