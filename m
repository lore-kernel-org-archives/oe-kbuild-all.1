Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAD53AD534
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 06:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774332436; cv=none; b=V25cWlbaJ1jcAlofAQY09IgfX966EnfVfTfvWex8YKf2WNYsZ3vgPLrCTVc9Cw8FToYyM/Qc15Qnhhnv7qn9M3vfRzg3luOk4W26hGD3AHfrDMBkp0EUI9R/H2mPW4FxzZzlnLtl4lUi8PfZG2/SRK9In4xbszrIQtP+dde9zUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774332436; c=relaxed/simple;
	bh=eqf2FLKj4abGa2ySsa88PgosSoDNF2cJrUajLngDYSc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WI5MqhFEjsUBAppxx/1IGPHX+Wts+kKakgFCFVFDcA3JaCwX6avi7AvkEFmKZjiNd2PZUEupB+PtBKh8DZlSE/F1iInp+zibRBnjlHIc2dgBZKZti4Xy6DsqVMfBHmafrCHuTOoYWWCUk75Kbvg0qeUzCipi02n3TH9kKnPiAIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WIfuJ57i; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WIfuJ57i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774332431; x=1805868431;
  h=date:from:to:cc:subject:message-id;
  bh=eqf2FLKj4abGa2ySsa88PgosSoDNF2cJrUajLngDYSc=;
  b=WIfuJ57ix1or/4KV1SsZqJE1GAt/Xp4Djf/8h5lhO3TYKu5wLBRVB4Vc
   eoEJkQoJuiXsOOxWQnemwfUXMMu7VSbApKG0AYOTC1k5KyN0XefNVQ3Vi
   7J+tK0rhC4D4BhxhvGrbniYTht84tWFUmHejEukzpmD/ny2iMBAggiqCK
   vw9Kz1azRNS3T6we9GczEZ/k9WfGQscEtRHGbnkyALqyG4iEKBLc2nUSm
   esCL1BCy7qvzbWa1G/N5Om8JpybDMQ3vb3oYdFhlvo4pR2JWN6nUW3ejs
   ICeJ0uIsrdS0cAAWcFbRBFw63/j/xKknOn2JL0KjMx4HzgTjd7WzqCIKv
   w==;
X-CSE-ConnectionGUID: 3r5HJQRKQ7KyC0UxM4eswQ==
X-CSE-MsgGUID: FYMHXR4pS/+th9U0QVydIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="74361935"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="74361935"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 23:07:09 -0700
X-CSE-ConnectionGUID: F7619GFuTd64IE+2uLT9GA==
X-CSE-MsgGUID: ihNXCnzcQ8Sk4afImpPSmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="221362035"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 Mar 2026 23:07:08 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4uuw-000000003xF-02Hm;
	Tue, 24 Mar 2026 06:07:06 +0000
Date: Tue, 24 Mar 2026 14:06:33 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-crypt 34/42] vmlinux.o: warning: objtool:
 netfs_prepare_buffered_write_buffer+0x30e: netfs_wait_for_encryption()
 missing __noreturn in .c/.h or NORETURN() in noreturns.h
Message-ID: <202603241400.YW8IPkEC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-crypt
head:   ae7ccdf83025020c44837849de26fb4546fbf825
commit: d045bc8a941a2f79f07a9d3fc62b3596fa4a4326 [34/42] netfs: Perform content encryption for buffered writeback
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20260324/202603241400.YW8IPkEC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603241400.YW8IPkEC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603241400.YW8IPkEC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: netfs_prepare_buffered_write_buffer+0x30e: netfs_wait_for_encryption() missing __noreturn in .c/.h or NORETURN() in noreturns.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
