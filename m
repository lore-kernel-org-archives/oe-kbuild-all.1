Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFF2495021
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 08:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397767; cv=none; b=R6rC2rB2bLBB7mYq18Lgh/FI6YuAwKLGCREDHrIrSUrN0SxbE7taIR5O6SDYnYnQCdoRX5AAPPFtLFd56yf3W92ZtHm6RoviVdpQCoi/YV1jxC6D0uTFt5b4TvElRZd+8aVmxZjRU4uDgilo9GM6FdG5CJ5KMVh9KL5Wrrm7UiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397767; c=relaxed/simple;
	bh=WWAIShMdjFY94grbBUXkQVOtdhE7XaVNGVTircdJUEY=;
	h=Date:From:To:Cc:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AJi5HBM2GRB5Enxaa5FKcz6DoSITv0yegs2dQE8rCdRms8SjQubs4PwAD7keL1vyFQv0aFtXoShc6Pe87mRjZR0GJjk6LHQxJ0SC+eLHSDfdl5ieFNrpbIBYKTe92CaL8kFM9yjQU/sCriT8Q+wFZB5onjPcXsqbNM/EXmU2uAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DNDnU7Jf; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DNDnU7Jf"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so3150335e9.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 01:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792397764; x=1793002564; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QdP5SrdtqTRy2WGPh+JDfRDdgFlXL2Ti8LPGAckK34A=;
        b=DNDnU7JfmKTg3na/oOsNNXdkDmL0n8d0TBo0uyt6PGfeppveL6ZXK+m50zbel+C3wC
         XnvYq9//GNDXC5TcP57bKBKYX9UsGtPjJ01SLGWHFAn41Qz8F9GkmrtAkoiE3fOMtEYF
         q7ooXHhCB27a9zZ0S636OZBuEr6UIIxIUpIBzMVRaEvLRvxI016GXpIBwUDUFWyGoA8U
         GIVBWbtLPl0lxG0wTTlBPnwwQvATkgilaFcBDW3NTmF5bSZ3xTuPkeLDWSrwqUG71Dsx
         fe4rrNH4wViP5APN4MwekFAt2lpWu8AD3pph6r3zsfXkrDsw+R5vcxVJJWSGh7E1N/Lc
         YjXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792397764; x=1793002564;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QdP5SrdtqTRy2WGPh+JDfRDdgFlXL2Ti8LPGAckK34A=;
        b=DSRSKbYjXXoiA1sC32xqb3+a1XkJJX2mWVjvAX7K8GJUa4LLs1617eiZxdzE5h5OP5
         s1N+7V83HFRU1AfDflkf02jLYYWBqnj/HNEQ3hA8gZuIDQvXyQIercBlk6hIa4yJJnDU
         TPK+KjAEzQjepiqbYAFayDEwzHejU3zMdTekiRwIugPL8q2/Pb2ldE33Te0XCq+I3nl2
         82V4JHOoFHrSUzVefzAJWlJXRLR70UDOC0Y1CYPRhp1e71NsYVOzyuY7ktU2eO7ueYxV
         4PbiXLDYO1Sj103QRVqQ5uuli1QvFzW+6gYAYT+DA7G2rdiPW3MaNEfRG/fDb4Kwi1De
         iK+A==
X-Forwarded-Encrypted: i=1; AKwUvBzBIAzaqJ/ALJTI7crlIiBF9HyTL5wBCXPDT036eeXGeWSV9K6ZPxmaoFJ8QO4hdAZTEizyc4xshoocis+3@lists.linux.dev
X-Gm-Message-State: AFq9FYIzlfWByMLVYvw38waTRR7jIKtMRDT3+W+nkxBmkM/Z7LYG4CLq
	CgkUVLZ3xotKX8iqyIecM2ozlfbYroyNhNuVXwGcxmqMdbTZxEjiFiOZ
X-Gm-Gg: AYBFou3a362cAHU7fVTtDvrzLLU15ugryQ7CRF9WUH9matFM3n+XawZbe+cP0BOW41Q
	s4RGJOOYdLP372htaSCQ8nKweJDCt91G55WqtNm80qc9xDUShl6Hx3rjYC0mnrm/M47Hiip1X+x
	HhxY1mkb6gXumojqHQk4oqXwSeOGEzrXTVzc6XvXgHZIZf8MEQrG2k1t8I9zps6jHSw+oYBs3nh
	DyYHVmynud7jSggCu5X/DcrAVyB9PYMXlk3SwK2CqLhmPjzHgYfkAZGNpJ41/Lw2g3W3pkETnxw
	fevHfIlfSKTDFVqFGMZz7w0QN5C9zghIn8ouTHM59trNFFN0XZQ2949q0IDzgZjAOcvcA+TfTwc
	+xfdP+0SODqrQy0WfwOx+zrtqL3tGnQqUDNv2uVcRqAzkXEm+lpnqMh/EQjgcQt2AN6SQtVWu2x
	/AkQCzlDgnoe8obxoG7FwyKHYGYio0i4UIUDHV/CkivJduFWBUnG5qQIqrBYqfSUJAbGc=
X-Received: by 2002:a05:600c:630d:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4a1d75fe0fbmr135593775e9.8.1792397763966;
        Mon, 19 Oct 2026 01:16:03 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e3ebb3aasm175994535e9.0.2026.10.19.01.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 01:16:03 -0700 (PDT)
Date: Mon, 19 Oct 2026 11:15:59 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amade@asmblr.net>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Message-ID: <atXRv7ugNH2a2XET@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4
head:   ba982c33278c1fc739c8c220f410d6539de9d9b9
commit: 568406bc832e7e9e333e2ab05aafd0b83ffb9610 [37/72] ASoC: soc-dapm: Remove widget from cache on removal
config: nios2-randconfig-r2202-20261017 (https://download.01.org/0day-ci/archive/20261018/202610180339.A6POXeNa-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610180339.A6POXeNa-lkp@intel.com/

smatch warnings:
sound/soc/soc-dapm.c:2893 snd_soc_dapm_free_widget() warn: variable dereferenced before check 'w->dapm' (see line 2891)

vim +2893 sound/soc/soc-dapm.c

b97e26980f6c13 Lars-Peter Clausen   2015-07-21  2870  void snd_soc_dapm_free_widget(struct snd_soc_dapm_widget *w)
2b97eabc09f42d Richard Purdie       2006-10-06  2871  {
568406bc832e7e Amadeusz Sławiński   2026-10-14  2872  	struct snd_soc_dapm_context *d;
2b97eabc09f42d Richard Purdie       2006-10-06  2873  	struct snd_soc_dapm_path *p, *next_p;
a3423b02cf745c Lars-Peter Clausen   2015-08-11  2874  	enum snd_soc_dapm_direction dir;
2b97eabc09f42d Richard Purdie       2006-10-06  2875  
1c9096f32ad23f Kuninori Morimoto    2022-10-17  2876  	if (!w)
1c9096f32ad23f Kuninori Morimoto    2022-10-17  2877  		return;
1c9096f32ad23f Kuninori Morimoto    2022-10-17  2878  
2b97eabc09f42d Richard Purdie       2006-10-06  2879  	list_del(&w->list);
5c6679b5cb120f Thomas Hebb          2020-12-12  2880  	list_del(&w->dirty);
8ddab3f5107c39 Jarkko Nikula        2010-12-14  2881  	/*
8ddab3f5107c39 Jarkko Nikula        2010-12-14  2882  	 * remove source and sink paths associated to this widget.
8ddab3f5107c39 Jarkko Nikula        2010-12-14  2883  	 * While removing the path, remove reference to it from both
8ddab3f5107c39 Jarkko Nikula        2010-12-14  2884  	 * source and sink widgets so that path is removed only once.
8ddab3f5107c39 Jarkko Nikula        2010-12-14  2885  	 */
af6d53db28e644 Kuninori Morimoto    2026-01-20  2886  	dapm_for_each_direction(dir) {
a3423b02cf745c Lars-Peter Clausen   2015-08-11  2887  		snd_soc_dapm_widget_for_each_path_safe(w, dir, p, next_p)
8872293fc38c49 Lars-Peter Clausen   2013-06-14  2888  			dapm_free_path(p);
a3423b02cf745c Lars-Peter Clausen   2015-08-11  2889  	}
8872293fc38c49 Lars-Peter Clausen   2013-06-14  2890  
8ad13cdc92f663 Trevor Wu            2023-05-26 @2891  	dapm_debugfs_free_widget(w);
                                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^
w->dapm dereferenced here

8ad13cdc92f663 Trevor Wu            2023-05-26  2892  
568406bc832e7e Amadeusz Sławiński   2026-10-14 @2893  	if (w->dapm) {
                                                            ^^^^^^^
Check is too late.

568406bc832e7e Amadeusz Sławiński   2026-10-14  2894  		if (w->dapm->card) {
568406bc832e7e Amadeusz Sławiński   2026-10-14  2895  			for_each_card_dapms(w->dapm->card, d) {
568406bc832e7e Amadeusz Sławiński   2026-10-14  2896  				if (d->wcache_sink == w)
568406bc832e7e Amadeusz Sławiński   2026-10-14  2897  					d->wcache_sink = NULL;
568406bc832e7e Amadeusz Sławiński   2026-10-14  2898  				if (d->wcache_source == w)
568406bc832e7e Amadeusz Sławiński   2026-10-14  2899  					d->wcache_source = NULL;
568406bc832e7e Amadeusz Sławiński   2026-10-14  2900  			}
568406bc832e7e Amadeusz Sławiński   2026-10-14  2901  		} else {
568406bc832e7e Amadeusz Sławiński   2026-10-14  2902  			if (w->dapm->wcache_sink == w)
568406bc832e7e Amadeusz Sławiński   2026-10-14  2903  				w->dapm->wcache_sink = NULL;
568406bc832e7e Amadeusz Sławiński   2026-10-14  2904  			if (w->dapm->wcache_source == w)
568406bc832e7e Amadeusz Sławiński   2026-10-14  2905  				w->dapm->wcache_source = NULL;

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

