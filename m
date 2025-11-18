Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C702E29E115
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Nov 2025 04:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763440780; cv=none; b=HyPS/XfeBzfnh9KLkubBtdkyusOKHoAz2IMHpV8pjsX/NpNJoWrXwxI8sX4qK4hCKlF2GikEHXqzxmoDWl3YRoIw9ZUCbbU2iH/OZ1pW+IKfqOmr41LkhvMg2bL8VW4MWXK4fYE0W/hf9y7YW4lhu3XUy4xecxfYjZujIb8w3Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763440780; c=relaxed/simple;
	bh=Q7WqXO7hsYhQjM4skJ2KgEST5RN65l5t3apDpdELwQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bwqm3+tG/f1o2MSfbO5Gt9CL2McFnExbr/T0BVSWmIEgYiN+R9rGUBoOA31CdbNR+QI87LHaz7kF1c9nd5e5udqlbQ6woWbn1IPe9Y23htYNxrdTlVkgqlQ4RbQn9mULisskesW3r4bl8gG7mvw4RZ6CW4PUUTtcJnqoo0rfEf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CGs9O6yy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CGs9O6yy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763440779; x=1794976779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q7WqXO7hsYhQjM4skJ2KgEST5RN65l5t3apDpdELwQ4=;
  b=CGs9O6yy8F31Za1e3XeRypQK7T+tQAWmNDnDB3/oTfw/DZI3Jb1mddy8
   IZR1hog9xrlBdVy6CMkfZNjvoAvuMCMiL3HlC6ZwiS3obC66N/9lC1mwm
   UGCYncsUSMmUmOFydmsaWo0oJLrqlP28NGyaFljT+Br2IUBJWUJWXHUsJ
   964F/IbQByjAgCRjn5lATcDaBx9SQrirlqMyBD6FAwDS9eBPwXah067w2
   mV4lWwuuyNveH4FOk8CaRiTWLDLTR6niyNIHu0h5x9IE1FSqYqWH3uOUV
   Cj/WmeM9bW8uVOroZbXHryGuz/2WcZ9SsK9lDMa7bS3PlgYIYqa/6YEX9
   w==;
X-CSE-ConnectionGUID: m2qQIFilSmiuAdjc+fZkBw==
X-CSE-MsgGUID: FhjvVfXfSdC6cpKLWCe57Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="82844666"
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; 
   d="scan'208";a="82844666"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 20:39:39 -0800
X-CSE-ConnectionGUID: QprgDflwRnqrR32ZhtwqBQ==
X-CSE-MsgGUID: lBb/taJtQSC4e+AN0sT7PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; 
   d="scan'208";a="191092323"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Nov 2025 20:39:37 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLDV9-0001KZ-0L;
	Tue, 18 Nov 2025 04:39:35 +0000
Date: Tue, 18 Nov 2025 12:39:07 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:keys-pqc 6/9] ERROR: modpost: "mldsa_87_verify"
 [lib/crypto/tests/mldsa_kunit.ko] undefined!
Message-ID: <202511181235.nK0PEW23-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git keys-pqc
head:   e298b80f8063fcbc335870ff3f1d59dae4d5116a
commit: 063e7379ca52344edf2253e59d40970d3f528803 [6/9] crypto: Add ML-DSA-87 pure rejection test vectors as a kunit test
config: arm-randconfig-002-20251118 (https://download.01.org/0day-ci/archive/20251118/202511181235.nK0PEW23-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511181235.nK0PEW23-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511181235.nK0PEW23-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "mldsa_87_verify" [lib/crypto/tests/mldsa_kunit.ko] undefined!
ERROR: modpost: "mldsa_65_verify" [lib/crypto/tests/mldsa_kunit.ko] undefined!
ERROR: modpost: "mldsa_44_verify" [lib/crypto/tests/mldsa_kunit.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
