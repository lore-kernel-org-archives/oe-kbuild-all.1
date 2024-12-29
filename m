Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676A7259491
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Dec 2024 00:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735431794; cv=none; b=daQfXBUMH51ViRFdHzdRhKFsvAxAZFi1xJh60E4epHK3vtx5TvXr7ZAXfUwema8TwC0PbFG8GPUoAqN70DWHaj9AFcvhxltmP/xrgVyGrQ6JMLOKULkD/bdzBrWEVSl25IhqCkuFFY+Hagto7Ga3qKLpv2ZJFqF+ScHUwMYeOM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735431794; c=relaxed/simple;
	bh=w5CuLyvEswAH4ma9NLpBQGSBvfEsUt5nXyaKkpxkAME=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YkUJjemVeUWrMMLtVzFO+9N944OBCbfG1498jJG/znv05QYFxZddunvZY+1r25IbfuqIUxDZYaOHvMFfl5kASf4AmNrFFYQI5olRX9Mq0tOX5SbXNCNZtC8Mjtuzy5vBYj/QcOQSgXcmt0ADt/BfjwTTKzC89n50N/dr9CbKjUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bqKt2/X/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bqKt2/X/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735431793; x=1766967793;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w5CuLyvEswAH4ma9NLpBQGSBvfEsUt5nXyaKkpxkAME=;
  b=bqKt2/X/TXMRBw/RvQuz68gu5hvbOtrV2Y8VZNIQ8saNjVAMVVm2w55d
   N3ONQnXF7cyO5p///awZVNjGrzC2INRVsaBIa+bcBeWD1Ut0zG4wRxzrg
   mnZrakuDb6uy2rvBa4eVf+UaVLUzIKAczRvyCCePQdBjECBHkQAwmLt1v
   ddyHNlPyNlEjk2RnfVQcogaiWJomNaTLp3RDTZtREmadHW89iI7MFRRFb
   S+aEpsP/zsgl/8eJxo2r5hJgZmpaPODq8KfbhxtpObgMYxwgz5kQqRRqN
   PAKEabFt+IfiU4nYHYqkg8ZGefONuqgHHRbbRW9rHmjal55bnh9R3JZtl
   w==;
X-CSE-ConnectionGUID: 8f47TyuaRzyOtWz1hsQy5w==
X-CSE-MsgGUID: wOBTGZ+pTZagEnCvrU8O1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="23366726"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="23366726"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 16:23:12 -0800
X-CSE-ConnectionGUID: YEsA7+9tRTS/gUuLgFUBCg==
X-CSE-MsgGUID: g541s3eEScSEVIYsZdyP+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="100294838"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Dec 2024 16:23:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRh5I-0004Oo-1v;
	Sun, 29 Dec 2024 00:23:08 +0000
Date: Sun, 29 Dec 2024 08:22:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jaroslav Kysela <perex@perex.cz>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>,
	Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: sound/core/compress_offload.c:1071:5-11: inconsistent IS_ERR and
 PTR_ERR on line 1072.
Message-ID: <202412290846.cncnpGaw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   059dd502b263d8a4e2a84809cf1068d6a3905e6f
commit: 04177158cf98a79744937893b100020d77e6f9ac ALSA: compress_offload: introduce accel operation mode
date:   9 weeks ago
config: i386-randconfig-054-20241229 (https://download.01.org/0day-ci/archive/20241229/202412290846.cncnpGaw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412290846.cncnpGaw-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> sound/core/compress_offload.c:1071:5-11: inconsistent IS_ERR and PTR_ERR on line 1072.
   sound/core/compress_offload.c:1132:5-11: inconsistent IS_ERR and PTR_ERR on line 1133.
   sound/core/compress_offload.c:1223:5-11: inconsistent IS_ERR and PTR_ERR on line 1224.

vim +1071 sound/core/compress_offload.c

  1062	
  1063	static int snd_compr_task_create(struct snd_compr_stream *stream, unsigned long arg)
  1064	{
  1065		struct snd_compr_task *task __free(kfree) = NULL;
  1066		int retval;
  1067	
  1068		if (stream->runtime->state != SNDRV_PCM_STATE_SETUP)
  1069			return -EPERM;
  1070		task = memdup_user((void __user *)arg, sizeof(*task));
> 1071		if (IS_ERR(task))
> 1072			return PTR_ERR(no_free_ptr(task));
  1073		retval = snd_compr_task_new(stream, task);
  1074		if (retval >= 0)
  1075			if (copy_to_user((void __user *)arg, task, sizeof(*task)))
  1076				retval = -EFAULT;
  1077		return retval;
  1078	}
  1079	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
