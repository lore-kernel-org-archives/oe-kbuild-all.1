Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889A017BB19
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 20:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725135026; cv=none; b=CaDcTMx+YVUWOUJWHWI38ZUPoCvOalaOE0aEf0VvCNo9Cf1c8TYdXEErxoJjqVoS7LyX+DT7AFAgSUoVxQPNiEQVF7C/fnLFxMyAkTaXUzaj1mg8k1luteqhVWkEyy6GjHWT9KS2EN5tto2Qd8dYHYAT3YM/B+9E98HgkJOLbGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725135026; c=relaxed/simple;
	bh=ynoORa0Ti+9igh/YbY9OxjXelGyHqlqQMv2Yi5Vga+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gbi4r6elXIKhOY+OpIdrecIBv7jaoswOfCLV9RKU8jM/EjM+kIHZUNHASort0+QM1uiXmdoxRx84vKoH9POL49bVxNyIew1cqgGj5EcSe5u9iMjYPUXYkrV5PfIaItEOpJEKKc6h1F13vmgyXGJSd10i1rdTiMv724vxqlLz2nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RERdwqGO; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RERdwqGO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725135021; x=1756671021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ynoORa0Ti+9igh/YbY9OxjXelGyHqlqQMv2Yi5Vga+U=;
  b=RERdwqGOCowMP1qYLKgUU8sRjSgVE2SL7irzyanheVNFtGb4VhM5Cn1c
   oHg8Ug0ANZHGeUs7JxbfMndEcRnCnlqVMpmZG/wr1StXrKcLoNZKSEekB
   A+XBx8b6p+a/IMax46wdmdPshY4Qv9DqpmoxzrzQeXrtqxOvoRPPYKWNO
   B1D5HfiEj/AEbS6WxuTjATBqd8nZtXzz9maOFUD+wQxdRZWJw1sKiDNvI
   hdkaGQzhX5yX5F+phG8WVwkUQp4S3uQKaAT/xsfszXQ20Cu9Mpf2nv7Rb
   thyt7JmzCnEAK678/NK9a5d9d9SfGGzf0d4XdNI6L/chDftrD4/E08dKv
   Q==;
X-CSE-ConnectionGUID: CrCqpkOhSG2t7mA+cHO9sQ==
X-CSE-MsgGUID: 8rKyaIaFSZeCUeOKO4wIqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="26662789"
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="26662789"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 13:10:19 -0700
X-CSE-ConnectionGUID: 5hrsC27VTkWt+4VMqWnTSg==
X-CSE-MsgGUID: eNlU50j7QviipkLvBJh0vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="101683819"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 31 Aug 2024 13:10:18 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skUQJ-000351-2f;
	Sat, 31 Aug 2024 20:10:15 +0000
Date: Sun, 1 Sep 2024 04:09:52 +0800
From: kernel test robot <lkp@intel.com>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [tiwai-sound:for-next 11/11] sound/core/pcm_memory.c:196:51: error:
 passing argument 3 of 'kstrtoul' from incompatible pointer type
Message-ID: <202409010425.YPS7cWeJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   61bc4deff033181992408f973b48fca08757d3ff
commit: 61bc4deff033181992408f973b48fca08757d3ff [11/11] ALSA: pcm: replace simple_strtoul to kstrtoul
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240901/202409010425.YPS7cWeJ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409010425.YPS7cWeJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409010425.YPS7cWeJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/core/pcm_memory.c: In function 'snd_pcm_lib_preallocate_proc_write':
>> sound/core/pcm_memory.c:196:51: error: passing argument 3 of 'kstrtoul' from incompatible pointer type [-Wincompatible-pointer-types]
     196 |                 buffer->error = kstrtoul(str, 10, &size);
         |                                                   ^~~~~
         |                                                   |
         |                                                   size_t * {aka unsigned int *}
   In file included from include/linux/kernel.h:25,
                    from arch/sh/include/asm/fixmap.h:13,
                    from arch/sh/include/asm/pgtable.h:22,
                    from include/linux/pgtable.h:6,
                    from arch/sh/include/asm/io.h:21,
                    from include/linux/io.h:14,
                    from sound/core/pcm_memory.c:7:
   include/linux/kstrtox.h:30:90: note: expected 'long unsigned int *' but argument is of type 'size_t *' {aka 'unsigned int *'}
      30 | static inline int __must_check kstrtoul(const char *s, unsigned int base, unsigned long *res)
         |                                                                           ~~~~~~~~~~~~~~~^~~


vim +/kstrtoul +196 sound/core/pcm_memory.c

   174	
   175	/*
   176	 * write callback for prealloc proc file
   177	 *
   178	 * accepts the preallocation size in kB.
   179	 */
   180	static void snd_pcm_lib_preallocate_proc_write(struct snd_info_entry *entry,
   181						       struct snd_info_buffer *buffer)
   182	{
   183		struct snd_pcm_substream *substream = entry->private_data;
   184		struct snd_card *card = substream->pcm->card;
   185		char line[64], str[64];
   186		size_t size;
   187		struct snd_dma_buffer new_dmab;
   188	
   189		guard(mutex)(&substream->pcm->open_mutex);
   190		if (substream->runtime) {
   191			buffer->error = -EBUSY;
   192			return;
   193		}
   194		if (!snd_info_get_line(buffer, line, sizeof(line))) {
   195			snd_info_get_str(str, line, sizeof(str));
 > 196			buffer->error = kstrtoul(str, 10, &size);
   197			if (buffer->error != 0)
   198				return;
   199			size *= 1024;
   200			if ((size != 0 && size < 8192) || size > substream->dma_max) {
   201				buffer->error = -EINVAL;
   202				return;
   203			}
   204			if (substream->dma_buffer.bytes == size)
   205				return;
   206			memset(&new_dmab, 0, sizeof(new_dmab));
   207			new_dmab.dev = substream->dma_buffer.dev;
   208			if (size > 0) {
   209				if (do_alloc_pages(card,
   210						   substream->dma_buffer.dev.type,
   211						   substream->dma_buffer.dev.dev,
   212						   substream->stream,
   213						   size, &new_dmab) < 0) {
   214					buffer->error = -ENOMEM;
   215					pr_debug("ALSA pcmC%dD%d%c,%d:%s: cannot preallocate for size %zu\n",
   216						 substream->pcm->card->number, substream->pcm->device,
   217						 substream->stream ? 'c' : 'p', substream->number,
   218						 substream->pcm->name, size);
   219					return;
   220				}
   221				substream->buffer_bytes_max = size;
   222			} else {
   223				substream->buffer_bytes_max = UINT_MAX;
   224			}
   225			if (substream->dma_buffer.area)
   226				do_free_pages(card, &substream->dma_buffer);
   227			substream->dma_buffer = new_dmab;
   228		} else {
   229			buffer->error = -EINVAL;
   230		}
   231	}
   232	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
