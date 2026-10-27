Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793099404;
	b=YJXw7p+tWHsnglNMFRjVbHNCgSR6+xb/mtQrAC4UPpaF9a5MyfluV/poB44YNHbI8EWN
	 kUvnMefHf6hIGSkmZ7iLgF1WUwmVozO6KU5zvJGMV1binZuyLA1Vjxb56OBpWWD3TKDKr
	 fwJBYHIyP2Ot3TcnP9W2bkcpb+qItbJ5BIDQBBm6/+mG38EjK0QidWxuXBptcFzDBI4PL
	 xjQbLeJdWwEeGtCn7qhxg5sd9wpNbfQf1mM0R04+wbnHjmO6dwJjeDNblqA22s6aWyIKb
	 6kO/HuIN4MN4UxqZhwpPWogF47nsyWiS4Jp+0ls6NC6GGF+z3YOI6GdesNZUERnjr6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099404;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=O9izclAEA0W22b46C8xwlR0bHdapPxeNbfKvw4fo2ik=;
	b=QFy+quUSmKEDc/zgz5qr8WOzvGT6WSI92YJPf+GsbWO24JXqRaq58AKn1oHVVK0FjAvt
	 Ry+dZiT5DWZnYArEKVNQ5r+t3BvtxzOQDeS2jMSr7833tClfN0M+igZIUWkdg79Wi3t2o
	 ayjJCuoEZ5WNg2B+/AcYWJgJNtvC6rOT5Ms2yD29YsTz+3zUzkRe7nx5uAFCuxpxZ7ytf
	 xmhUbDqscGBy54Lm/icLq7JQgFKYL00jhgpOJT+obQlwC1Z0a3XKl5Gr4/0Nt5jDuWPso
	 8gNNJ9UmdrcuD/yWHaZwaPEpCDXlZd4HaKjphZ8A7eg1cqFThMlhN9AmHM1GwBmy/4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QRA1ogwo;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C002606A321
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 11:10:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C002606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QRA1ogwo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793099404; x=1824635404;
  h=date:from:to:cc:subject:message-id;
  bh=R3arAOmlGXXh/EZ5ll4+RU+rlMTJaYiABs0YK4T65wA=;
  b=QRA1ogwoJWtJDCMOaOZxciYVusVweyVvdJ9IEyHwq70+9Hj1yRffXdGT
   WM3AXfkZrRdOLbTxLS6S0Gohji71uSg3EY65bfPs5P1BcZyS2qW4CvcM1
   CS5WH3yGuXCYyBE5oe2ABCGh7mJa9+FNqFxKlugArKHxvJ1AyusAWvVP9
   9kJi4EGdSjPtNYVshCGOx5rQeFJXV0pAaticXw1oh/uNdiyLs7EDZ40PP
   w8ZxoPJ+Ynn8HJPT3EdZWniC9f+f5qC0zg8AoYvLGwXoD4SXI3cI3PN3C
   Esg/M1lIQzXv/DVkOZUCGZdNTjhKnIOxhL4T5atQIbTF/ZcAR/0xkxv9J
   g==;
X-CSE-ConnectionGUID: aNH2K8c6RB6zVV2f4ug2wA==
X-CSE-MsgGUID: wbS0iCISQlC7ps8k+E3J3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1691305"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1691305"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 04:10:02 -0700
X-CSE-ConnectionGUID: OuZZAQ4tS6Gh/z3YFpYnOg==
X-CSE-MsgGUID: 6tU4ShiUTj+rQfE9lYrmxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="6269210"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 27 Oct 2026 04:10:01 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLf43-000000004Uh-0p3f;
	Tue, 27 Oct 2026 11:09:59 +0000
Date: Tue, 27 Oct 2026 12:09:45 +0100
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-10-27 364/366]
 sound/soc/soc-compress.c:688:22: sparse: sparse: symbol 'soc_compr_ops' was
 not declared. Should it be static?
Message-ID: <202610271131.xL6tGv2a-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/morimoto/linux sound-cleanup-2026-10-27
head:   a6f5f374420e4556475bd5e208cf57c1028d5e59
commit: 0bc75ed6346ab256217ddab6d1854d0337514415 [364/366] ASoC: soc-pcm: add new_compress() on rtd_ops
config: sparc-randconfig-r2302-20261027 (https://download.01.org/0day-ci/archive/20261027/202610271131.xL6tGv2a-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.3.0
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610271131.xL6tGv2a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610271131.xL6tGv2a-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/soc-compress.c:688:22: sparse: sparse: symbol 'soc_compr_ops' was not declared. Should it be static?

vim +/soc_compr_ops +688 sound/soc/soc-compress.c

   686	
   687	/* ASoC Compress operations */
 > 688	struct snd_compr_ops soc_compr_ops = {
   689		.open		= soc_compr_open,
   690		.free		= soc_compr_free,
   691		.set_params	= soc_compr_set_params,
   692		.set_metadata   = soc_compr_set_metadata,
   693		.get_metadata	= soc_compr_get_metadata,
   694		.get_params	= soc_compr_get_params,
   695		.trigger	= soc_compr_trigger,
   696		.pointer	= soc_compr_pointer,
   697		.ack		= soc_compr_ack,
   698		.get_caps	= snd_soc_component_compr_get_caps,
   699		.get_codec_caps = snd_soc_component_compr_get_codec_caps,
   700	};
   701	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
