Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABA926E716
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Oct 2025 02:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760755709; cv=none; b=Nk/hr22Hh7qr5LII1/iomHtBWIm3Td+ev5zJraXUWjH7NdZ22UkANxZYsR0RMm0GXJJAQBO35LJvy9HIhlmUmeEs9EVI/7cXGvuyeGf4GjNS1wz6102CGSkI23r6mlSBi99aKhWijV4f2dOy2vPtA6BhQjOep42uHeCBNhyfbIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760755709; c=relaxed/simple;
	bh=+hb6g7ycRIHE8O0sGN5Yt+ypCK79SCKeXg1wSEYt1hw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l1W4lHyRtFgAWRMVJnPCN4Im9xYXSB73lejtwhTLtvA/pNdgvch7kfRoVX8v3g1zLxw3lZIOSd5j4960YHdVoSsjRo23esN4GnMPsexdK9R7u/R3qNscE+LUSBC0cwGQCZGRggLnd/4eZQj6oLD1jCwAyVq7vEzyplCY7RZNt+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PCzccYKV; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PCzccYKV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760755708; x=1792291708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+hb6g7ycRIHE8O0sGN5Yt+ypCK79SCKeXg1wSEYt1hw=;
  b=PCzccYKVUF5ZUzJvR8COpX2XYohVgFkTT+l1Wk6aHaas1ABlnZyQpnYr
   +uByu9n2aD1W1gM9+DmPt1chVlyxAE30l8D4qwtLrcYnOthzybCK2mFA1
   TuiS2FrthuOdsccvjAH7pUm4tGjcdd5gNyCNUF4d9T8SjNyTaU9cOirwQ
   pAfwYRZa7VZ7psAUrMu6GraVA9VampK8J76dwfdzuagoK3Wr/KIeeM7DA
   8GrGFO/G8r2TID4OASq3yNwFtERsk3rfp1JbNtjsNEpPu6Fw6+fUqpz7X
   TmPP/ZT6z9s5XziMTrN4IVlE3wSQXnxqRtXQIOvTH8P6jWIwj6Dd4AVCm
   A==;
X-CSE-ConnectionGUID: x5cYmlU5ReiMXd3ERuKHtw==
X-CSE-MsgGUID: 122hNf4TQ4qqSYnuRe2Ycw==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="66611757"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="66611757"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 19:48:26 -0700
X-CSE-ConnectionGUID: hkbLQMKzQyS6Edb9SfTQaw==
X-CSE-MsgGUID: Uoio5aLzRPWPu242+RtazA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,237,1754982000"; 
   d="scan'208";a="182523278"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 17 Oct 2025 16:12:25 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9tcU-0007qV-2G;
	Fri, 17 Oct 2025 23:12:22 +0000
Date: Sat, 18 Oct 2025 07:11:46 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:keys-pqc 5/17] ERROR: modpost: "sha3_256"
 [lib/crypto/tests/sha3_kunit.ko] undefined!
Message-ID: <202510180735.cWW9fTZN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git keys-pqc
head:   91d7b63566e977976872603971e4a3ec4efeeb60
commit: f9c854c115e801bf9ea3f69be40029074003066a [5/17] lib/crypto: Add SHA3 kunit tests
config: powerpc64-randconfig-002-20251018 (https://download.01.org/0day-ci/archive/20251018/202510180735.cWW9fTZN-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510180735.cWW9fTZN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510180735.cWW9fTZN-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "sha3_256" [lib/crypto/tests/sha3_kunit.ko] undefined!
>> ERROR: modpost: "sha3_update" [lib/crypto/tests/sha3_kunit.ko] undefined!
>> ERROR: modpost: "sha3_squeeze" [lib/crypto/tests/sha3_kunit.ko] undefined!
>> ERROR: modpost: "shake256" [lib/crypto/tests/sha3_kunit.ko] undefined!
>> ERROR: modpost: "shake128" [lib/crypto/tests/sha3_kunit.ko] undefined!
>> ERROR: modpost: "sha3_512" [lib/crypto/tests/sha3_kunit.ko] undefined!
>> ERROR: modpost: "sha3_384" [lib/crypto/tests/sha3_kunit.ko] undefined!
>> ERROR: modpost: "sha3_224" [lib/crypto/tests/sha3_kunit.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
