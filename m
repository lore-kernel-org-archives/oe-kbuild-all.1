Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792480060;
	b=IhuYkXNJGciaX9YgzCco5EGHg//xMvBu4LnPWOUhW0E/0Lyg/HDzV0TQkiWwU7YLSt9C
	 ATsUqvc4xsiUaHRp3NHRFvjp3ddEpstH/o9NJjKB+5D7uFKJoLFUWi1u9k4wkGP6cdCnn
	 WEdIkRQppehmQChiWHZA+V80c8jGYsvU93HTe7CIyiMkiSGFMpaG4HCTj+4X2JGVsmvj9
	 EhbkpFXkB1Sl9ph759Ky2JTrjLPytp+pZG+PLvxGLzt5g2sFbx0Rp3RiTNikJsRyZXuer
	 KIvMHiVURNnhXCouietbOy1oCTig5WAvUjYw/QewGqk/9RPVTko9VnPgZMlJLzHShZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792480060;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=qjxyYSF91bhYabHfV+gH5gJvnuKSiy9mVBJrt+2Ux6g=;
	b=zDbXx9lncQvs775i3ZDgqzp3AgZ5bc+z2vQz1fkOaynaSXAAHCXzns3yel+/m3jGLoLt
	 9OzJomotH0+TkxcPY1HuxgivRjPVE4f9+Kvxvg/F9iiK/RU1iaN0LQlhk+vFZnahZHgq5
	 27YIG978g0DzhqSKqPysjoTzV8LL1MAqxDp59YJI6DKuMt4vuU32UNLjo53Kwjzf1Pd+7
	 HqI6CJhh19kHGU/a4WjEocCJSGxkUEFvbu91Ey5p6FcFNScEDWYIdWz9c8OzBAoFiSi40
	 +84psOhnW9N9sOzyGh7IcpvSfkCAiDVhm++pKGiXpX2LIZ3KBJio4Hfgl2mFMc1FSAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="j/LegYQ5";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2A7606A31C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Oct 2026 07:07:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F2A7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j/LegYQ5
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso2461685e9.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Oct 2026 00:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792480058; x=1793084858; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qjxyYSF91bhYabHfV+gH5gJvnuKSiy9mVBJrt+2Ux6g=;
        b=j/LegYQ5QvXqbtS66oEuZNzd0bK59jxE8di2UPW8xepaD3zbVFSzYEYZQZDQ76EC6T
         T+UX5s451scxzl3BeI8V5AbmGgMrE6DqlQBSClxnXiU1Xe1NXj1R1c0R4cIn4lRIPf8T
         l1F6tek5sE78NoJMn6zCw7bcarqvHl+9lifBXoyr89Q9Q1MN5PII7r8iU6opcLjtu/IE
         JShemOwY7wyCgSAJGKdJ+emp2JA058uGZsbmGGBKRMzoajzYfYqUml9oTegX5PMNbXLk
         6AN/MYN6F23Tps6YzmN88VbRdgkIgKXxR9DUtUVtzOHhN+nq27RsRZPAjWQGRVZD3bE4
         yy+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792480058; x=1793084858;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qjxyYSF91bhYabHfV+gH5gJvnuKSiy9mVBJrt+2Ux6g=;
        b=yciScCxBbPpYOsMNREizdpRsy0q8Ae+Y9ZEmxCSpbjQbUwqLpjfiwc5pTW/iUePikt
         9TP14ik3QDEZg2P9KVcQeUrrPmalpZ3dIfTI0Tf2x3B0ttdj51RjrDYjsPCBUCmRQAoi
         tmONEHdBtBWTUm7R1Q75xYY1L14qWHka1P5jA8/XTfFv2rodPUS9H7dP87VxPHFKIp76
         /MTL1GRX+g1ErEZdRbOLkoLMtV6Jl1Ap9uNzuZqQyRouMh/Brq9s5P4vtQPrf/kw1kyO
         n8889YDQFwArG5d8XaLOUzcirQqjbqeQNQcywiCV5IAq1iExYGCK2T0iPpZ/CyM+5xWW
         HxWg==
X-Forwarded-Encrypted: i=1; AKwUvBzeBQ4H9Ofq7vYOWVmrYSNIMoIHZrKghR1QlqWUGNOIxVWf+NSGVvBgMaSpwg2aGue7jc8Bp7dpkcNwNQkZ@lists.linux.dev
X-Gm-Message-State: AFq9FYIuTyZrLbmI1nch2R0uukzoeMYx3Hz0VJhfLMfsoXRNlTwBzBE2
	eS3O/mdYW7kOjOcNr6PJMLvJCbmLIIEZ5G0t/ewX6QWqX/nx/1yAwCoA
X-Gm-Gg: AYBFou0KqRQEm0rvtBUSr2y2T2jA36sYTzm+4lw/o+duNa7CKW2aaOFLk8DlWmABySN
	rQaYfpOFSKTQnU5z05kEkj9YYfM7bQn8jgkjTnztecqid4kj9f9/gu2DwJqPa0w5nhM/5EnPMRN
	Uj+Uk39XigZnkboIOWSuteROApGvVCjFTzFEvRf9lycrZm4GSbuWPb1DF6a7A7Qni30qOQ0qH1n
	9sLby5F6QGK4fjYa0EJsUZMPfELQRhRJjq8rsP2ku87k4D1ZdEGnCRZBt66BnPdsxlbfHu+zCj3
	Nbd6cZk0oqY1zHeFQth/r+LTi6mPk8WOn4lNOt0JPcPSYlpfWPTmiibLVSUfQQyJ1Zvodtrf9pD
	8Ouq36toh5NzyQkXwRpqTf4XBKsyMHps/8v5LA47szlXSz5jluAO+4Vi1qR1jnHXn4JEa1V6aXK
	J93wIJLv3Xq5XO0xYLHQBZG+fEUUhMUA1B8C0orkIj5H+/5ZM8ZyJzAIoFjlU4FgrHoc0=
X-Received: by 2002:a05:600c:6610:b0:4a1:7f96:9b42 with SMTP id 5b1f17b1804b1-4a1f4fa26a5mr27283035e9.15.1792480058415;
        Tue, 20 Oct 2026 00:07:38 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2ca3666sm50510085e9.1.2026.10.20.00.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:07:37 -0700 (PDT)
Date: Tue, 20 Oct 2026 10:07:33 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 291/291] sound/usb/pcm.c:1053
 snd_usb_pcm_prepare() warn: variable dereferenced before check
 'subs->cur_audiofmt' (see line 1049)
Message-ID: <atcTNZI9wkxpuNjM@stanley.mountain>
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

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   aaa0cf06ed53d6805dfa9099535f6fc052c49086
commit: 1eb185541df90c3f790676b9ac362683de3519f2 [291/291] ANDROID: sound: usb: Add vendor's hooking interface
config: i386-randconfig-2200-20261020 (https://download.01.org/0day-ci/archive/20261020/202610200641.Ba5XQ2g4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610200641.Ba5XQ2g4-lkp@intel.com/

smatch warnings:
sound/usb/pcm.c:1053 snd_usb_pcm_prepare() warn: variable dereferenced before check 'subs->cur_audiofmt' (see line 1049)

vim +1053 sound/usb/pcm.c

e5779998bf8b70e Daniel Mack          2010-03-04  1041  static int snd_usb_pcm_prepare(struct snd_pcm_substream *substream)
e5779998bf8b70e Daniel Mack          2010-03-04  1042  {
e5779998bf8b70e Daniel Mack          2010-03-04  1043  	struct snd_pcm_runtime *runtime = substream->runtime;
e5779998bf8b70e Daniel Mack          2010-03-04  1044  	struct snd_usb_substream *subs = runtime->private_data;
61a709504b07911 Dylan Reid           2012-09-18  1045  	struct usb_host_interface *alts;
61a709504b07911 Dylan Reid           2012-09-18  1046  	struct usb_interface *iface;
61a709504b07911 Dylan Reid           2012-09-18  1047  	int ret;
e5779998bf8b70e Daniel Mack          2010-03-04  1048  
1eb185541df90c3 JaeHun Jung          2020-05-26 @1049  	ret = snd_vendor_set_pcm_buf(subs->dev, subs->cur_audiofmt->iface);
                                                                                                ^^^^^^^^^^^^^^^^^^^^^^^^^
Android adds this vender hook

1eb185541df90c3 JaeHun Jung          2020-05-26  1050  	if (ret)
1eb185541df90c3 JaeHun Jung          2020-05-26  1051  		return ret;
1eb185541df90c3 JaeHun Jung          2020-05-26  1052  
e5779998bf8b70e Daniel Mack          2010-03-04 @1053  	if (! subs->cur_audiofmt) {
                                                              ^^^^^^^^^^^^^^^^^^
before the NULL check

0ba41d917eeb87f Takashi Iwai         2014-02-26  1054  		dev_err(&subs->dev->dev, "no format is specified!\n");
e5779998bf8b70e Daniel Mack          2010-03-04  1055  		return -ENXIO;
e5779998bf8b70e Daniel Mack          2010-03-04  1056  	}
e5779998bf8b70e Daniel Mack          2010-03-04  1057  
47ab154593827b1 Takashi Iwai         2015-08-25  1058  	ret = snd_usb_lock_shutdown(subs->stream->chip);
47ab154593827b1 Takashi Iwai         2015-08-25  1059  	if (ret < 0)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

