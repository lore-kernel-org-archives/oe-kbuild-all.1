Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E1E3DEAC9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 10:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774349677; cv=pass; b=qIUZgE/4/bsUWfgJ96Y9EZEWZn4LyX8yUwIQ1Tx5R9j57jpymXm/ntDB4i2WBQJ79lQXH+6BfccvONT/Osj9OTfhsf30Bzh10enm9rfGWxDtKUCOq8mBW1R5wChKBeSCCwM6MCVmIC7pUpe7eFlyLgG1erAiA+tfDNl+p8z+cd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774349677; c=relaxed/simple;
	bh=RES/GDDu6KBclak6NqQ4jqepO12FsJpn6soJLgJMk2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TmXWIhNdpJ+ghChas0jw6UAIpG70EEupAhyz9XAELCFHtCClUQtCrgzF11wIKVyloFrbQ+g6dAHXGMtT2XXrHh6SPc/6UBxdIlQqJLfcMq+dnbzATjF9s/CXWk+bqrzuYqbGvd/3+ggAtvsZcT7Ul19l3Pjvgs3KkW+MF01eqgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZuHGbKf; arc=pass smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZuHGbKf"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-67baebf716bso638141eaf.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 03:54:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774349675; cv=none;
        d=google.com; s=arc-20240605;
        b=AKJmYyyYufCXXj4GkcB27FBBE//SJl7WcwCtHPu6Z8h9rdrGNzRE/ZaSZf/lo1a/Mv
         QdIiNUGr+ORHFaEBqWABSpp0ZaxYFtOudjr8RjYnv1JReXypBXI8ew/HbxiJMxhEUmxH
         somYbA+YDhqLtzaugeBe8VNia+4vlSFvVE/9pJtIT4DkQyQzxz726qyLn31l0JHm6+J6
         TxG8PI4D47AwdFbgaM4U5muo8eYWRvHtpNDZWBOl1zZImEDED31Q1AdP8dKVD73ccUV+
         ZaxrvsbWvt5ohsn0MRzbi0ES2UaYc77nHkLShGFybMsIpy1s3brUSbZ/AqKEHdGEElWv
         MC0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4xZa/0j22+oqg1nMErzFxx2lp9k+a1i473iPRNI2fUs=;
        fh=TkkxnlyFKcmIFesI1/PHEU80wJjm0DT4oYhbtly5iuU=;
        b=c3oMuY1lDpWNg4nZ/+Yf5WgaV9bRSCFMtkJ/7rdEmeRUC03q2tMTKMsszz4P3312a7
         huD3zlWj+KteqFf1pEcwsRti/8pe8bl7jsSjkA8gM4JqkC2kaR4LopNwz0YM44itvtVQ
         l11menTRzOkCC+WSCCYWfXK5oI8fNTJCJ2tFpb/vOItBipDjXZ/J/P7z4kRBpA33r+V9
         GxfaBBkkk2SL8jHhCfbCcqfsbwmgGZSsuFieLTYZQ2cG979VCA5q1c7Vf+/MwwN1PoqY
         +YyWfWbJwkTrd8Vl5CYX6bIGdQoiqWZPxFTzC1DB5BbcjsipY4aYXCXbxKGX1xzKLF6E
         6seQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774349675; x=1774954475; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4xZa/0j22+oqg1nMErzFxx2lp9k+a1i473iPRNI2fUs=;
        b=EZuHGbKfio0kR0qmyzQpj7EaX64kCsbdQGUamgzpA5aB/4NIsv/ZTaZurn0dHhHgqo
         6yVJHGyWpyUEQ7OB6mqIXn6+3YZ1brRXM/wEvnb+MYeG7FAg4fcE+8Aj3A7McBA1ajmz
         b5ZpQM+SMeE2M+g0G3bPHg3FNHGeCKneTbv1kogw58hvtYS2LkjZ+jSUeQzD6lorxRYt
         1tr+592F/7CT73HIm3DWkr7SmcDL/KksBMp0akIoVS1v4dbtZZZ/0A8Ifhgu9eDYSP6g
         cgtst4/9lqXmtio4vtIWJ4Rlqq0lR2wYzepQQhqzx/VU5+FSuCIoDfD9Fs5n9yYo3L7S
         Iumg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774349675; x=1774954475;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4xZa/0j22+oqg1nMErzFxx2lp9k+a1i473iPRNI2fUs=;
        b=VurMZc6sjtHj4SGmQgwLrn7peYwKwVLOAVDyQINu4Q3kW26J0QKUGyqFNir2VuU+MR
         1Hc8BtIhd+TcpQl5PanEZXoSMy2oCzANOpKC3i1yqMZDbokwkD5/EnrEdkdbYk3av/E1
         eKknc+FRXMswvW2pRRk3bopTzGjWpvMH/MdAKOJh9C6XpCIlLEx9YScM7aS2Xv/w0AeT
         yE9GOmMIKJbV+yaukOdvF4LEHnycl9drwLfd44BidDaabfpGmhrlXdsShPwcm4wY8qNe
         yBSq5LvF5nqNAtc/8Qd1v8zIKPAuLCWa3EZSJ+cUoFzF1LTgt7ONNzYtU+sd7NtMy7k3
         U1Rw==
X-Forwarded-Encrypted: i=1; AJvYcCVMBrrTNudunZQgtO7qxP9xUwyDvrXFuY0+LnragqYMOMTM5R939IH3Esp94Nxm+fLOfiiJ1yGC2B6+958P@lists.linux.dev
X-Gm-Message-State: AOJu0YzVhAxVoQuBEoogCvq16zJpjjk+ywyFAKAfnm/9pJMKAyKcrYi9
	ABKolYqrI3njj7ij7ayuDBoF/BEdbx46WhMFT+BglcaC9UaRgYXmpQEH4A7obRMJlyqaavsQ1Gb
	U00WrdMuhpkZAFo91mSJoGS+B90ke488=
X-Gm-Gg: ATEYQzzAUaYFpMHytGnOLW4CM3fulzBq+5fLn2h+qiVvpcruSR6Icz/NcgIiXrNHiTj
	seYdgC2Non2Xb2NHMRjFZQ63MPsmZm0KOPHBW0TmY8ry7xUxCWLC8RhIaA79IaxP7PTH3YOwkAG
	WXfyVI0R9QnGrUPozjgFCe0unAc6AlSPgLZp5ICzxxfsW5fid4eNGU80rcVkLBl/U8XY+NOH68R
	SiPmQdgKAnIk9J+PNeSXXGpCnCuw7I8coW/jWWb9i9/qUgX/SzMvpCrne0QcQtIenlFxpz2okNG
	uv8MEtZjadhhza37PWMT9/rUvqMxDDMABqA+lSnKwY/BnNPF
X-Received: by 2002:a05:6820:2d4a:b0:677:98b4:79ab with SMTP id
 006d021491bc7-67c22f74118mr13202109eaf.33.1774349675421; Tue, 24 Mar 2026
 03:54:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260322164943.37460-1-devnexen@gmail.com> <202603241635.qNXDPwjs-lkp@intel.com>
In-Reply-To: <202603241635.qNXDPwjs-lkp@intel.com>
From: David CARLIER <devnexen@gmail.com>
Date: Tue, 24 Mar 2026 10:54:23 +0000
X-Gm-Features: AaiRm50vrYNk_mlAnRdMfp0nxFOpfo962oTnSfj2Jot4SGUmcie4lybU4o5qGTY
Message-ID: <CA+XhMqzK39zZu7_KG37RJSeiR56fUON2CQsDN_L1W3+BuZzHmA@mail.gmail.com>
Subject: Re: [PATCH] mm/memcontrol: fix obj_cgroup leak in mem_cgroup_css_online()
 error path
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Qi Zheng <zhengqi.arch@bytedance.com>, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

On Tue, 24 Mar 2026 at 09:10, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> Hi David,
>
> kernel test robot noticed the following build warnings:
>
> url:    https://github.com/intel-lab-lkp/linux/commits/David-Carlier/mm-memcontrol-fix-obj_cgroup-leak-in-mem_cgroup_css_online-error-path/20260324-010357
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20260322164943.37460-1-devnexen%40gmail.com
> patch subject: [PATCH] mm/memcontrol: fix obj_cgroup leak in mem_cgroup_css_online() error path
> config: arm64-randconfig-r072-20260324 (https://download.01.org/0day-ci/archive/20260324/202603241635.qNXDPwjs-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 14.3.0
> smatch: v0.5.0-9004-gb810ac53
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202603241635.qNXDPwjs-lkp@intel.com/
>
> smatch warnings:
> mm/memcontrol.c:4180 mem_cgroup_css_online() warn: variable dereferenced before check 'pn' (see line 4176)
>
> vim +/pn +4180 mm/memcontrol.c
>
> 6f0df8e16eb543 Johannes Weiner  2023-08-23  4168         * regular ID destruction during offlining.
> 6f0df8e16eb543 Johannes Weiner  2023-08-23  4169         */
> e77786b4682e69 Shakeel Butt     2025-12-25  4170        xa_store(&mem_cgroup_private_ids, memcg->id.id, memcg, GFP_KERNEL);
> 6f0df8e16eb543 Johannes Weiner  2023-08-23  4171
> 2f7dd7a4100ad4 Johannes Weiner  2014-10-02  4172        return 0;
> 098fad3e1621cb Qi Zheng         2026-03-05  4173  free_objcg:
> 098fad3e1621cb Qi Zheng         2026-03-05  4174        for_each_node(nid) {
> 098fad3e1621cb Qi Zheng         2026-03-05  4175                struct mem_cgroup_per_node *pn = memcg->nodeinfo[nid];
> 59f75a1877fbf7 David Carlier    2026-03-22 @4176                objcg = rcu_replace_pointer(pn->objcg, NULL, true);
>                                                                                             ^^^^^^^^^
> Dereference
>
> 59f75a1877fbf7 David Carlier    2026-03-22  4177                if (objcg)
> 59f75a1877fbf7 David Carlier    2026-03-22  4178                        percpu_ref_kill(&objcg->refcnt);
> 098fad3e1621cb Qi Zheng         2026-03-05  4179
> 4a2f95f5c79e02 Qi Zheng         2026-03-09 @4180                if (pn && pn->orig_objcg) {
>                                                                     ^^
> Checked too late.
>
> 098fad3e1621cb Qi Zheng         2026-03-05  4181                        obj_cgroup_put(pn->orig_objcg);
> 4a2f95f5c79e02 Qi Zheng         2026-03-09  4182                        /*
> 02b5fc7885d9f8 Andrew Morton    2026-03-09  4183                         * Reset pn->orig_objcg to NULL to prevent
> 02b5fc7885d9f8 Andrew Morton    2026-03-09  4184                         * obj_cgroup_put() from being called again in
> 02b5fc7885d9f8 Andrew Morton    2026-03-09  4185                         * __mem_cgroup_free().
> 4a2f95f5c79e02 Qi Zheng         2026-03-09  4186                         */
> 4a2f95f5c79e02 Qi Zheng         2026-03-09  4187                        pn->orig_objcg = NULL;
> 4a2f95f5c79e02 Qi Zheng         2026-03-09  4188                }
> 098fad3e1621cb Qi Zheng         2026-03-05  4189        }
> a0dd8b1942f5bf Muchun Song      2026-03-05  4190        free_shrinker_info(memcg);
> da0efe30944476 Muchun Song      2022-03-22  4191  offline_kmem:
> da0efe30944476 Muchun Song      2022-03-22  4192        memcg_offline_kmem(memcg);
> e77786b4682e69 Shakeel Butt     2025-12-25  4193        mem_cgroup_private_id_remove(memcg);
> da0efe30944476 Muchun Song      2022-03-22  4194        return -ENOMEM;
> 8cdea7c0545426 Balbir Singh     2008-02-07  4195  }
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>

Seems Smatch is flagging the inconsistency, but pn cannot be NULL at
the free_objcg label because all nodeinfo[] entries were fully
allocated in
  mem_cgroup_alloc() before css_online() runs. The old pn && check was
unnecessary defensive code.
Kind regards.
