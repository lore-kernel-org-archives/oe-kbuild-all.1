Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983681FF61A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 14:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732717638; cv=none; b=IMEcoywOus4hKl1R/uFcNH2syzn1oNtBBhwqj7jayGgtqhP3TY0FgCWXMqHz7+YXdybGYoT8AQUo6i/PoVC+I+IbdxOeZZYUdQBrixA8j/Qh4yIh/iXsgXECelT/6NCx4wNPBook6nRvWt99DkNIzJyKH3V+7uwSJliC6mX332A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732717638; c=relaxed/simple;
	bh=YdBhvmk7K3bpjuQkMLpjrZfz75oq7z8yoaigctNQqck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XQHAj6s8lcjO2ngJlnGP44tHnEsGymremUuZ7qiY6v/HR41qhlDZAW6bheFrJU90X8wrwtmluRXRKct2mruY/T6vySFYS7jHI5ai3bpHUbNp6CzCFBTWUvv0TfEI/LmMSWzZzGrbd2+TUt7Sn4ruWBTg8AYzOw4hqxJpsM3EAWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DQBuBRoo; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DQBuBRoo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732717637; x=1764253637;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=YdBhvmk7K3bpjuQkMLpjrZfz75oq7z8yoaigctNQqck=;
  b=DQBuBRooXxTW+X/H3NtMJ8121KqIARw26zaVA7Bdz+xYIcp22SJOCU9s
   Dqvf84NHEvCwrRBcUTI0suz51KOj3gWzgT5eJ7tkj1hErgM8Q7OKG6LeV
   /Dbest6R795NxwUIutzS0hD+tuHba3/xUoO7jWKd95wMpEtiZJNi851Z5
   +hmo/+Ste7cAHCo8zmoN9kXzKrXVHge/ZL8k+miq+WevyBRWcsdoR5Zx4
   X4j5hW+yX1oeNiAxDjIiaAn3VAVr//1a8Xe52Gb7wpTwS5m6yT6F3WCJN
   GzAMOEP2iK6xzN67Jowx97Vafkae08kUWtvPF8rRDXb3/vBUecw1rkj0C
   g==;
X-CSE-ConnectionGUID: hcykHgqSRHe6JNEa8y+paA==
X-CSE-MsgGUID: OgLw8Q77RR2+Zylah9/R1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="50450186"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="50450186"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 06:27:13 -0800
X-CSE-ConnectionGUID: lp7nuPh7T+uwY1P2iQHkbw==
X-CSE-MsgGUID: nCPwPM0KS7K6snCjwDGJlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="91895537"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Nov 2024 06:27:12 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGJ0X-00083W-14;
	Wed, 27 Nov 2024 14:27:09 +0000
Date: Wed, 27 Nov 2024 22:26:34 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/v8-crutched-refs+fallback 22/24] veth.c:undefined
 reference to `io_iov_get_page'
Message-ID: <202411272222.TYjfzOtM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/isilence/linux zcrx/v8-crutched-refs+fallback
head:   6e979a2d2fc5d6612d460184427d65fffe6b7c8e
commit: 0655c3486db7c28d14f0dd70fe5c7904030d7407 [22/24] [NOT-FOR-UPSTREAM]=
 veth: add support for io_uring zc rx
config: loongarch-randconfig-001-20241127 (https://download.01.org/0day-ci/=
archive/20241127/202411272222.TYjfzOtM-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20241127/202411272222.TYjfzOtM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411272222.TYjfzOtM-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/net/veth.o: in function `.L10001=024':
>> veth.c:(.text+0x64f0): undefined reference to `io_iov_get_page'

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
