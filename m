Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794885921;
	b=L534i3HDRxg3bTVgVEq7B17vbqO/R7w6wIY47U3n1msAmBQYIeyFRfJ0yKh6kLS9jTnF
	 SsXUZ96cU+5+HTiu/PRx0S88NgFsP0p2rI7zTsFYwCwXuYD/QrhKL3rYyD8a0CBfk/CJO
	 9xBtX5gudGpYsiPSBS6htJ8J5PvOQmI0rt5rN4OpItNzU69ND3GOUO+ecUOz4Gi8fO1ns
	 ggpRxEZCd9mi1GFc6nVJk+muNT9xc9YppUf2Mv8aUny8LzNIQtcXE/PBob3+/3nYKILtv
	 i/4kC49m13VvoN7QJQHKw2jdGRVAhmKLutUL/5aCYJQeTbf0sOQgy7qOJikRWZ6Btvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794885921;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=8Jqgc0Hms00UTCbrJG7L/DbTOJl/w33uwlPos8N4vRQ=;
	b=oqXi/IeJotQOioaQSd2ZoEXXZ4ELG8HdKXZD7YG0R2zoZZJHGpsJ4i//A7vDinAe4CFM
	 1/1aAjeodgbegNAStpNx7LfqpMceL8dEew61UddwWsrM3Wb9VU1wsJxtNGiXxUqhdjC6x
	 NOPnbyJAjiXx4VQBm6QqyKK1OXb7bNV2BCnP14KggdkNATPAoxUEbfAdp2PkEEJWa3mqk
	 mWVlM+ZMU8Vou3ZcaNbWKMh6iK+9gY5oI82+zsXJ9jzapkDBiyh8PCg8bWwbq42SeF+YJ
	 f+s1qrhp5U7ZFQfva1o5Zkl5POK2XI1WkNik4jx4xHP1wJhtynm/OGuMTwhteKr+5Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eiY0CB+c;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548E0606A32A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 03:25:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 548E0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eiY0CB+c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794885921; x=1826421921;
  h=date:from:to:cc:subject:message-id;
  bh=mJhmuWVJfMO9jl9MPYosDJW5vlIYRQFyrozWwFeQO3o=;
  b=eiY0CB+cz+0u+4BIFI4NeTYA36IRaTFd09FLVY1eZ/Kn4pmZAPdxRchN
   CAHAcBZI5MJdGLooRu0ooWfeh0ME+3L9WGwdlRECagEZmfyzMDDCdMHPZ
   FYZqdcbrJmYYEZZ0JeGNGWXJYGVlP8PoZwpdmEn4y7qv4SaGYXVFzPds0
   Ym7flzGYixy+fkS0nEqB3On2tOPSEBex3oRbI5lexCs3kV4Roc6veCKqs
   xT/M5ayFJTChlHgRVaEcsoQqEcQM/4kOH5RxG3RQko2TjvECCtT3ScgNv
   A5OXHSsa6CiILvWhUkrj88tFw8kI7WCaeqYSFaLyNdZ529iZ7XbB8zRcS
   g==;
X-CSE-ConnectionGUID: eIlqakQ3QSOonuQu2e8hpA==
X-CSE-MsgGUID: StW+/3/uREqbs1QkCt/EIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3538308"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3538308"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 19:25:17 -0800
X-CSE-ConnectionGUID: qdMWd4hERKewh1Vq0PqHzA==
X-CSE-MsgGUID: XadJXEoWRii3Ooo3bvROUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9507165"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 16 Nov 2026 19:25:15 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT9om-000000002x3-3IXE;
	Tue, 17 Nov 2026 03:25:12 +0000
Date: Tue, 17 Nov 2026 04:24:28 +0100
From: kernel test robot <lkp@intel.com>
To: Sofus Forstreuter <sofus.c@icloud.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>
Subject: [asahilinux:bits/240-isp 2/96] htmldocs:
 include/uapi/linux/videodev2.h:849: WARNING: Invalid xref:
 std:ref:`v4l2-pix-fmt-apple-ax03`. Possible alternatives:
Message-ID: <202611170310.ZOQhdGHd-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   41eeb3a08926fbe6037568be57148a360190fbe6
commit: b642459ace2ee29eb0b5842d41a2babdb0d9f091 [2/96] media: v4l2: Add Apple interchange pixel formats
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.23, Python 3.13.5, on linux)
sphinx: sphinx-build 9.2.0
reproduce: (https://download.01.org/0day-ci/archive/20261117/202611170310.ZOQhdGHd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611170310.ZOQhdGHd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:621: ./include/uapi/linux/landlock.h:63: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:621: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:630: ./include/uapi/linux/landlock.h:241: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:630: ./include/uapi/linux/landlock.h:264: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/networking/checksum-offloads:157: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]
>> include/uapi/linux/videodev2.h:849: WARNING: Invalid xref: std:ref:`v4l2-pix-fmt-apple-ax03`. Possible alternatives:
   std:label:`v4l2-pix-fmt-pac207` (from userspace-api/media/v4l/pixfmt-reserved)
   std:label:`v4l2-pix-fmt-pjpg` (from userspace-api/media/v4l/pixfmt-reserved)
   std:label:`v4l2-pix-fmt-pal8` (from userspace-api/media/v4l/pixfmt-indexed) [ref.missing]
>> include/uapi/linux/videodev2.h:849: WARNING: undefined label: 'v4l2-pix-fmt-apple-ax03' [ref.ref]
>> include/uapi/linux/videodev2.h:846: WARNING: Invalid xref: std:ref:`v4l2-pix-fmt-apple-ax12`. Possible alternatives:
   std:label:`v4l2-pix-fmt-p012` (from userspace-api/media/v4l/pixfmt-yuv-planar)
   std:label:`v4l2-pix-fmt-p012m` (from userspace-api/media/v4l/pixfmt-yuv-planar)
   std:label:`v4l2-pix-fmt-mpeg2` (from userspace-api/media/v4l/pixfmt-compressed) [ref.missing]
>> include/uapi/linux/videodev2.h:846: WARNING: undefined label: 'v4l2-pix-fmt-apple-ax12' [ref.ref]
>> include/uapi/linux/videodev2.h:847: WARNING: Invalid xref: std:ref:`v4l2-pix-fmt-apple-ax16`. Possible alternatives:
   std:label:`v4l2-pix-fmt-mpeg1` (from userspace-api/media/v4l/pixfmt-compressed)
   std:label:`v4l2-pix-fmt-cpia1` (from userspace-api/media/v4l/pixfmt-reserved)
   std:label:`v4l2-pix-fmt-z16` (from userspace-api/media/v4l/pixfmt-z16) [ref.missing]
>> include/uapi/linux/videodev2.h:847: WARNING: undefined label: 'v4l2-pix-fmt-apple-ax16' [ref.ref]
>> include/uapi/linux/videodev2.h:850: WARNING: Invalid xref: std:ref:`v4l2-pix-fmt-apple-ax23`. Possible alternatives:
   std:label:`v4l2-pix-fmt-mpeg2` (from userspace-api/media/v4l/pixfmt-compressed)
   std:label:`v4l2-pix-fmt-pac207` (from userspace-api/media/v4l/pixfmt-reserved)
   std:label:`v4l2-pix-fmt-pwc2` (from userspace-api/media/v4l/pixfmt-reserved) [ref.missing]
>> include/uapi/linux/videodev2.h:850: WARNING: undefined label: 'v4l2-pix-fmt-apple-ax23' [ref.ref]
>> include/uapi/linux/videodev2.h:848: WARNING: Invalid xref: std:ref:`v4l2-pix-fmt-apple-ax24`. Possible alternatives:
   std:label:`v4l2-pix-fmt-mpeg4` (from userspace-api/media/v4l/pixfmt-compressed)
   std:label:`v4l2-pix-fmt-mpeg2` (from userspace-api/media/v4l/pixfmt-compressed)
   std:label:`v4l2-pix-fmt-pac207` (from userspace-api/media/v4l/pixfmt-reserved) [ref.missing]
>> include/uapi/linux/videodev2.h:848: WARNING: undefined label: 'v4l2-pix-fmt-apple-ax24' [ref.ref]
>> include/uapi/linux/videodev2.h:851: WARNING: Invalid xref: std:ref:`v4l2-pix-fmt-apple-ax43`. Possible alternatives:
   std:label:`v4l2-pix-fmt-mpeg4` (from userspace-api/media/v4l/pixfmt-compressed)
   std:label:`v4l2-pix-fmt-pjpg` (from userspace-api/media/v4l/pixfmt-reserved)
   std:label:`v4l2-pix-fmt-pal8` (from userspace-api/media/v4l/pixfmt-indexed) [ref.missing]
>> include/uapi/linux/videodev2.h:851: WARNING: undefined label: 'v4l2-pix-fmt-apple-ax43' [ref.ref]


vim +849 include/uapi/linux/videodev2.h

   844	
   845	/* Apple Interchange, compressed and tiled formats */
 > 846	#define V4L2_PIX_FMT_APPLE_AX12	v4l2_fourcc('A', 'X', '1', '2') /* Apple Interchange NV12 */
 > 847	#define V4L2_PIX_FMT_APPLE_AX16	v4l2_fourcc('A', 'X', '1', '6') /* Apple Interchange NV16 */
 > 848	#define V4L2_PIX_FMT_APPLE_AX24	v4l2_fourcc('A', 'X', '2', '4') /* Apple Interchange NV24 */
 > 849	#define V4L2_PIX_FMT_APPLE_AX03	v4l2_fourcc('A', 'X', '0', '3') /* Apple Interchange P030 */
 > 850	#define V4L2_PIX_FMT_APPLE_AX23	v4l2_fourcc('A', 'X', '2', '3') /* Apple Interchange P230 */
 > 851	#define V4L2_PIX_FMT_APPLE_AX43	v4l2_fourcc('A', 'X', '4', '3') /* Apple Interchange P430 */
   852	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
