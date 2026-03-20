Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C939F37BE95
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Mar 2026 11:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774007554; cv=none; b=gQ1kOkthzCTwGf2x+FflnCbbrcp11tRIkMu4ktEA5EMMcN0CGkHtRO8E5S3KRa1AI6v+0mn6RVvdQ0yPUVtAEOLF0mUukQJ3jqWKYgPhrK4WvvlFFLmvjNTZfOt/5sV3xld3wQKoDm6f6TM80RQcxpfogV96R8r5cJf89BkEw3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774007554; c=relaxed/simple;
	bh=LaYJ2P1U2BubVo5s2X+Gy+NE+QcX4+lUlGPdg0VxgHg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AhXxjsBBvxNv6vW6f1AsfaTcl2oaoaxxGVSyNa6QnJEZqOmOpWdYRYvDp4LHe7WEbau67ocidGOZaARM8NMAQbUaBRNX+VQUftNJFxGkuVsXiq1M+VfRHugeyeda7z95uyvngmCIu+F1Z0wVanvr0VB2RJUvFEwRI+sJbkFaPIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UU5HH+Wu; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UU5HH+Wu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774007553; x=1805543553;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LaYJ2P1U2BubVo5s2X+Gy+NE+QcX4+lUlGPdg0VxgHg=;
  b=UU5HH+Wu7HYtCPj3sff8W3UbQEB7SsqzkXLoeWbXClAhld9FdM8TB1Fi
   vuSbiNr0my/kixp8n5RK6V+UcKoEd9jjC9A3kPWN0I+EZOlsYLrXYg83k
   T//c276Ank/dkda0lRvTiSB4Ze9o1F1S9EHBr1JT0xiTxsk0LCKgzXRt2
   /iznqs4qOQtgEIigCPd6lKxgWgAB1UHJLfnTje56dc+MneQ4qElx34LA9
   BLdN2TSTiM8CSOa02kxwT8dw9yOIgM6SdrXeb+wj1KYHgOMUUyuj9dZvl
   SJalZieLxAV4Xvgqz5s9N9D2rBhYLzIblrzob6HB5IAsuQkBesFBrJphQ
   g==;
X-CSE-ConnectionGUID: nLCzgNceTAm7joXhtosvQw==
X-CSE-MsgGUID: nMm6sV/NS3uuWRDCXAjiVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="97707682"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="97707682"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 04:52:33 -0700
X-CSE-ConnectionGUID: z1kya7lJTCaCPj5cTNjjtg==
X-CSE-MsgGUID: r9zEpfoWS62DGZ7k+7A3GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="223290449"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 20 Mar 2026 04:52:31 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3YOy-0000000051J-3HZi;
	Fri, 20 Mar 2026 11:52:28 +0000
Date: Fri, 20 Mar 2026 12:51:47 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 357/357]
 dt-extract-compatibles: error: unrecognized arguments: -d
Message-ID: <202603201207.EZOhTktQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi N=C3=ADcolas,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   61d924e3c943dec5a1544973025226b69d3e9ae4
commit: e20861fb88ee3302349370c595e2498122732f3a [357/357] kselftest: Add n=
ew test for detecting unprobed Devicetree devices
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/202=
60320/202603201207.EZOhTktQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260320/202603201207.EZOhTktQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603201207.EZOhTktQ-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   usage: dt-extract-compatibles [-h] [-H] [cfile ...]
>> dt-extract-compatibles: error: unrecognized arguments: -d

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
