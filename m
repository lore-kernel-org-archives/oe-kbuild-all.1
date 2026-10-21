Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562093;
	b=iNml3bCqUJ1E37t9gTwR9V/JxQMA1mesYK5f/AQxDFOw4neb6t/Lvzx6jPCjtm1kmDrj
	 wtxW+3FhJ0/VfrivJeyNi7M+HeLDi8Bi2w9pp2N8tC35fIaOnh1Djvvy7gambMDi64FCf
	 0opj6eIVTXxYGe6saFKFSQCL3mTCM18wJ6VS3b0LyiPcmemVBTH4VH1eFJBzrRrudlIZL
	 pWHE12bgs9wCZpRZRLJ5rfj7iZj64t40UIrbkwkR1zMuWuNnzqG7jS3fs3DMLrNjFiMvx
	 2f/MAgksakAUVX0X8au/te6NMY2V1y+bgfn03/0ze/tvE46DSw4GEQ1KZSCRyPSurSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=8Hu2GpYwKr6r5nRoavxB97ryG1ZJTfUyaAPfaDpbWQ0=;
	b=YVtF6q3JzUMoUJQOP5ycHt677QIXo2X92sYebEBp3zFh+LdRDWmNJgwUaL8TPbhApYNC
	 KOAXeMkW6weCHzxWKznXtAyuvnwfCpFKrx9X+n1ZUJOydUy24Mu4r+qDZthSl7Yu8z/lj
	 /YfPhrFnZtvjF59f5VD7YlhPvFPamobdh1CG0BlHodtpw/yZD20w/kETCQqak5kbog9oq
	 A4X7G2LSOh7MPtLU+qk5MfyafQU5UiyjhGYdhUXapqv3IWQA876w5MKtJoT33OZ62l9cd
	 h5VcLi20E8AXsua+tInRayefps5qEF9GxA2k2gjnMBhNU0YGDrK9/hz8Rf6FshZjcIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HFkAhDUp;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAD6606A31B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Oct 2026 05:54:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AAD6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HFkAhDUp
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2001dd4e7so565695e9.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Oct 2026 22:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792562091; x=1793166891; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Hu2GpYwKr6r5nRoavxB97ryG1ZJTfUyaAPfaDpbWQ0=;
        b=HFkAhDUpTwCEXrTXeGFzhhBUrmQca6WJBtYNVSoFRbtO4JrLXVCe6/geNx+pZXouqw
         OBckm4feEAVqceD6oJWRBR2QdwnhhVKAlSZF+fgGKClIj4ecmfu73FV9h9M+Ke0RLdKU
         irLaeJ37nzhu7vpV7Q1rshnI+z7rAgDO4/i4kD+VDJTsUJxIKEBp8rquNHlgVBepvY3A
         aGZxp6ID89g1QTALBuNcyI6tbZvDJ8HpAaXM6Onm2Ah7gJndmCTaULWKbJYNgOHL/2Bq
         jwO634r6Axz0h0T5MdEaanx0MqOS7jXYqKKqWMcRCebw+/Ye4gQxisSXrfSggUi5vGip
         34Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562091; x=1793166891;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Hu2GpYwKr6r5nRoavxB97ryG1ZJTfUyaAPfaDpbWQ0=;
        b=0b2pFUCAifnWwVv2VKzhtAOijXjxhrQ+opE+odbtGuaU7qO1Wt5N2m2o15BbpxO1qE
         4V4fVI8lFKQUXQJ4pTS40HRuEQ4wdSHV6OZikWt8ZlNTtx5W2CaZl51buIUYbM4ufkyN
         px6qYlFJId3y7/sG8qokOty8DBj6Af2xHhBqsi/3iKJBN6h33RKK2AgeDUbrcgtsTox+
         u5teoKxuTCI8t62CFkaGbsRrSc7zBrrLOcaD4I2mgbzHtaxEQl37VdEC9VyQZPic7Nfp
         u75Fu4weOhfp2P2lS/0bTFP3MbFc0THipG/0QCcG32nnLzQdUZgDiLc4ZHHLbnsnup0a
         92Ag==
X-Forwarded-Encrypted: i=1; AKwUvBy8XQ9PCAUu/iaHCoYoXezBpschF+JesD87tCpfFkk99ppt5b3jz5Amv7/b6SFQ/9NWOQ9cuCYpC1orPuoX@lists.linux.dev
X-Gm-Message-State: AFq9FYKSAqSy5C3Uo4HpMYrFM4kzkBci1ceWVLggnaK3yR+e3QMZPYjk
	ObQpHaWKkWFdm+lJUE6w5o9neRveyRui5+5gjHyJrtE+sIQJStRg5xNQ
X-Gm-Gg: AYBFou3EolfNb8ARrJ4WKarnlE6GxVmVWlp8E8EkRQOn5yV1zxemxlFP/NF0WUmEx2y
	HQLPYdrsrfl7XWvq3d6jWDTbh1o8Te0uHTKpJm1P+4n/LyaE/TC34EQk3vmSfb+k1iqk6Eyh4Af
	YP8aSxy9Hpjn/GxXp1yMLl399uDL3vegFsaqEV3I/o3O8FfLJEGDlP16x6sc0dHW2dDT+PpVYZe
	eL7IE8eSds1Weip8lN1dwoSnILZ41DJ9J/IyK56M7E+Wv6gv42cwlAMvvzWqdcMGcDdMDUyhmKX
	Z/7BdWxVwYAlYBvHAK6ig9XAaDYMijlZiLDHx0HSl3hIsl8YIZxq7HIdtZT74ZxtfTu2uEOV0EI
	955yaeh4GsFFI6LHoWWxzWxqHOm+ohkG87Os5iImC8t1LfWVic17xSmf694d74aiGv6huyvydt/
	bsGrMdQciWOJh6uNdYwO82cqIz+2K9JjBfA5XDopdtr18YUJU7y5CHHTmYdvvkGxG07VhXNBfvm
	wdWzE+s7zzI8R3at9nTu7i/UBhYVvpMRvRqTRSR2m56kenj4XCN
X-Received: by 2002:a05:600c:3d92:b0:4a1:e5ad:33b0 with SMTP id 5b1f17b1804b1-4a1fdaf75a5mr17000245e9.8.1792562090837;
        Tue, 20 Oct 2026 22:54:50 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc1066cfsm32594205e9.1.2026.10.20.22.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 22:54:50 -0700 (PDT)
Date: Wed, 21 Oct 2026 08:54:46 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Takashi Iwai <tiwai@suse.de>
Subject: [linux-next:master 18830/19064] sound/core/compress_offload.c:716
 snd_compr_set_params() warn: missing error code? 'retval'
Message-ID: <202610202334.hwrqtbb4-lkp@intel.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8f7df005a7564bd7ffa75da9c3085d5b996f1e16
commit: fbc74ca9fbf7e0b8f6872ccac62f9f4a1f3b5e53 [18830/19064] ALSA: compress: fix buffer leak on failed SET_PARAMS
config: i386-randconfig-2200-20261020 (https://download.01.org/0day-ci/archive/20261020/202610202334.hwrqtbb4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610202334.hwrqtbb4-lkp@intel.com/

smatch warnings:
sound/core/compress_offload.c:716 snd_compr_set_params() warn: missing error code? 'retval'

vim +/retval +716 sound/core/compress_offload.c

b21c60a4edd22e Vinod Koul          2011-12-23  680  static int
b21c60a4edd22e Vinod Koul          2011-12-23  681  snd_compr_set_params(struct snd_compr_stream *stream, unsigned long arg)
b21c60a4edd22e Vinod Koul          2011-12-23  682  {
b21c60a4edd22e Vinod Koul          2011-12-23  683  	int retval;
b21c60a4edd22e Vinod Koul          2011-12-23  684  
7ea9ee0064281e Srinivas Kandagatla 2023-06-19  685  	if (stream->runtime->state == SNDRV_PCM_STATE_OPEN || stream->next_track) {
b21c60a4edd22e Vinod Koul          2011-12-23  686  		/*
b21c60a4edd22e Vinod Koul          2011-12-23  687  		 * we should allow parameter change only when stream has been
b21c60a4edd22e Vinod Koul          2011-12-23  688  		 * opened not in other cases
b21c60a4edd22e Vinod Koul          2011-12-23  689  		 */
14324b8f0760ca Takashi Iwai        2025-12-16  690  		struct snd_compr_params *params __free(kfree) =
14324b8f0760ca Takashi Iwai        2025-12-16  691  			memdup_user((void __user *)arg, sizeof(*params));
14324b8f0760ca Takashi Iwai        2025-12-16  692  
c2f14ba749c1ce Markus Elfring      2016-08-21  693  		if (IS_ERR(params))
40a024b81d1cba Takashi Iwai        2024-09-02  694  			return PTR_ERR(params);
4dc040a0b34890 Vinod Koul          2012-09-17  695  
04177158cf98a7 Jaroslav Kysela     2024-10-02  696  		retval = snd_compress_check_input(stream, params);
4dc040a0b34890 Vinod Koul          2012-09-17  697  		if (retval)
9b02221422a55e Takashi Iwai        2024-02-22  698  			return retval;
4dc040a0b34890 Vinod Koul          2012-09-17  699  
b21c60a4edd22e Vinod Koul          2011-12-23  700  		retval = snd_compr_allocate_buffer(stream, params);
9b02221422a55e Takashi Iwai        2024-02-22  701  		if (retval)
9b02221422a55e Takashi Iwai        2024-02-22  702  			return -ENOMEM;
4dc040a0b34890 Vinod Koul          2012-09-17  703  
b21c60a4edd22e Vinod Koul          2011-12-23  704  		retval = stream->ops->set_params(stream, params);
fbc74ca9fbf7e0 Peter Ujfalusi      2026-10-19  705  		if (retval) {
fbc74ca9fbf7e0 Peter Ujfalusi      2026-10-19  706  			/* the stream stays OPEN: drop the buffer of the rejected setup */
fbc74ca9fbf7e0 Peter Ujfalusi      2026-10-19  707  			if (stream->runtime->state == SNDRV_PCM_STATE_OPEN &&
fbc74ca9fbf7e0 Peter Ujfalusi      2026-10-19  708  			    !stream->runtime->dma_buffer_p) {
fbc74ca9fbf7e0 Peter Ujfalusi      2026-10-19  709  				kfree(stream->runtime->buffer);
fbc74ca9fbf7e0 Peter Ujfalusi      2026-10-19  710  				stream->runtime->buffer = NULL;
fbc74ca9fbf7e0 Peter Ujfalusi      2026-10-19  711  			}
9b02221422a55e Takashi Iwai        2024-02-22  712  			return retval;
fbc74ca9fbf7e0 Peter Ujfalusi      2026-10-19  713  		}
49bb6402f1aa1e Charles Keepax      2013-04-18  714  
7ea9ee0064281e Srinivas Kandagatla 2023-06-19  715  		if (stream->next_track)
9b02221422a55e Takashi Iwai        2024-02-22 @716  			return retval;

This should either be "return -ESOMETHING;" or "return 0;".  The current
code returns zero but in an obfuscated way.

7ea9ee0064281e Srinivas Kandagatla 2023-06-19  717  
9727b490e543de Jeeja KP            2013-02-14  718  		stream->metadata_set = false;
9727b490e543de Jeeja KP            2013-02-14  719  		stream->next_track = false;

This could be deleted because of the above check.

49bb6402f1aa1e Charles Keepax      2013-04-18  720  
49bb6402f1aa1e Charles Keepax      2013-04-18  721  		stream->runtime->state = SNDRV_PCM_STATE_SETUP;
769fab2a41da4b Jesper Juhl         2012-01-23  722  	} else {
b21c60a4edd22e Vinod Koul          2011-12-23  723  		return -EPERM;
769fab2a41da4b Jesper Juhl         2012-01-23  724  	}
b21c60a4edd22e Vinod Koul          2011-12-23  725  	return retval;
b21c60a4edd22e Vinod Koul          2011-12-23  726  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

