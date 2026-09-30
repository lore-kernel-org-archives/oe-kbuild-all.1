Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBFC517BA2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 17:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790788072; cv=none; b=Bv2qRB+7f/zOzET8OHfFHHu87aAfefoniVKz/bOSdwdw4N4pfrKikZE2DVU754V27zrY4JgokLUjM+q7ihuZxAxAZoxYBd+HtoivS+utGgLjneXdPLhgVFwM2UfynjkQWQpdEisJXjWXrQPMwrzZaz71lNIVI17wqDTDqNgTAAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790788072; c=relaxed/simple;
	bh=Seb7A4BWFXeyZuXmj9R/LO8rCVuD/Rt6ng6P7bIJtGw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=q6iYNVZFwg1oiowJaP9WqJ+h2kQskLsl++/ULTyu9zLrLCheL9h5CJzXaGovox1TE/uWQsR+oJ750IE3InDo4EAijbUbAVPqTHp/EGyNHySvRsnw7uHQgr8THRyvJfjD7aWkLZHVusz/+auU6drXYB6Yw/+6kC8zdc9J63kYKoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=PDWXGZQu; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=nD9ssAqr; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="PDWXGZQu";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="nD9ssAqr"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790788067; bh=uupRo1CCMSKlZsGVe6XHCGg
	f/iV56NTda/N4Mp3I42o=; b=PDWXGZQujW6voGgFKXQqIAVE5IQl6F910aP5FcRp/iSpRiyFF9
	eB3f4gi9RqgiUnoDJkjGMBtflK9nGAukTt3prtajA8gZpomVObhv1JdpSrNQkNWUiLaUWepLp8y
	Yp1u4CV3xWDaaMwZp02q1NQDtXn5o60lrtdoH3eRLvdeGhiYJ5pFjmS8GZ4PZXsxWJNIWjkgLX6
	98vUW5NQ3EW6stK4zzvuOctz3ZOQVxVbSlDIcYLD5FEBfPnPcWV4NyZ6MvRo7h+LXaWixOzFop4
	3M//sGtygp8N9z/NO71L9AQFwQpU1RUa1tNJAtHG94wSUaKYL2iZqACi8V5G2KA1kbA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790788067; bh=uupRo1CCMSKlZsGVe6XHCGg
	f/iV56NTda/N4Mp3I42o=; b=nD9ssAqrqQhm6Qf1xI2650sBuJxgcOfyYdUeKfxkpZsBUV8ro7
	4Q1YLRUwXy+nSIHh/I3Eyh2ZQNtwrFX3KSBw==;
Date: Wed, 30 Sep 2026 18:07:46 +0100
From: Bradley Morgan <brads@mainlining.org>
To: kernel test robot <lkp@intel.com>
CC: oe-kbuild-all@lists.linux.dev, "Paul E. McKenney" <paulmck@kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5Bpaulmckrcu=3Adev=2E2026=2E09?=
 =?US-ASCII?Q?=2E18a_24/34=5D_ERROR=3A_modpost=3A?=
 =?US-ASCII?Q?_fs/btrfs/btrfs=2Eko=3A_symbol_?=
 =?US-ASCII?Q?=27cmpxchg=5Femu=5Fu8=27_undefined!?=
In-Reply-To: <202610010054.roP05vYH-lkp@intel.com>
References: <202610010054.roP05vYH-lkp@intel.com>
Message-ID: <D067807D-352D-4B55-AEE6-B1334711EBD4@mainlining.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 30 September 2026 17:48:44 BST, kernel test robot <lkp@intel.com> wrote:
>tree:   https://github.com/paulmckrcu/linux dev.2026.09.18a
>head:   90599c372e13369d11f6c1a01ff0094b16f72cf8
>commit: c98d10b438b5626edb3f4e06f4f62bcb6ed6fe90 [24/34] lib: Add two-byte cmpxchg emulation function
>config: xtensa-randconfig-1001-20260930 (https://download.01.org/0day-ci/archive/20261001/202610010054.roP05vYH-lkp@intel.com/config)
>compiler: xtensa-linux-gcc (GCC) 8.5.0
>reproduce (this is a W=1 build):
>(https://download.01.org/0day-ci/archive/20261001/202610010054.roP05vYH-lkp@intel.com/reproduce)
>
>If you fix the issue in a separate patch/commit (i.e. not just a new
>version of
>the same patch/commit), kindly add following tags
>| Reported-by: kernel test robot <lkp@intel.com>
>| Closes:
>https://lore.kernel.org/oe-kbuild-all/202610010054.roP05vYH-lkp@intel.com/
>
>All errors (new ones prefixed by >>, old ones prefixed by <<):
>
>>> ERROR: modpost: fs/btrfs/btrfs.ko: symbol 'cmpxchg_emu_u8' undefined!

What?

>
>--
>0-DAY CI Kernel Test Service
>https://github.com/intel/lkp-tests/wiki

--- Thanks!
"I'm not a very positive person" - Linus torvalds
