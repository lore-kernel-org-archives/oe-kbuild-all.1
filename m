Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4C918EB0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 23:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727653070; cv=none; b=ZCUghZX+F3Wwf5EFQ/H19KHCjTzdNQQkgjMDvfx7sJ1ws+1bdXb+xOqPyFizdU1IciS7DPYN8VhJFd4PMJWmLROUcKbDTS8yrj5zmON2kwHexPQ+gPiifUJoBn9mJll7CCqJ1emxtHXk+ZcgBcIVrRccZ5v40IMl5VBS8wNs3EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727653070; c=relaxed/simple;
	bh=YdJOxiMRje6cYi/OGa9krwNg3zQkHUx0utgYplkiLfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SmAD/nqiZWxNgHHy9N/oe1fFgjqQh5xfjApdbJIKU8SHFmYjkg06P76HpwRQyKi4eYTjZm+6wAvxLSM8qgf4Rn14B6+e5lQae+8BtVH5+1qVgAyRTxaSa+5DnkqHgherazy39L7xxrZmJQbtO5bSaK0knFrWA1xeyk045NCH2Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jSn0FyhT; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jSn0FyhT"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6cb2a6d3144so18192746d6.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 16:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727653068; x=1728257868; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uOsqmh7E9owRP2Y8VXqfruNsEYlHJ/GplBkTGVjjIFo=;
        b=jSn0FyhTEekSZywzexlAeNbSlUmXutuNWzSl0Xu1dvACnRrh0AADxca1rU36wCbofI
         6Y78CJGydFSFID7WTU+rtI5lxomtVvnIpTv7zORgVhKXY3/1xeoKEHxbMY9aZewZ1U42
         tTLtBALVF4PDFrUzmfI3xKGbdqG0wSZAVaEqH/VsfIWQuI2DkJgN+bg0ZOAz55aGTBVM
         aocLPzII5n5tqhe8SyrRJgW7Cv7HfLT+sRwr2EIT83POdxjNU9SIXeS6w1sNSzfdd7uJ
         D+CoTHDDUanGtS+ZsGLscXIXdPxTucbzARxZGUMP2C/kV4ucdyFNlU5qtNmpxHjQScLA
         Irww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727653068; x=1728257868;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uOsqmh7E9owRP2Y8VXqfruNsEYlHJ/GplBkTGVjjIFo=;
        b=wilcXHPH7yq2XXNDiKBMP4s8hYyoH9rYbuWkWneugXNzBlHUHq1MEW815AQpvUxVD5
         8tLjzifkVfKM3olMpfX/xIROJj/8JwiglOusbVq1co6qfu/o5dqSqSs18f2G24NBYRqh
         XkjR71+iUmjjcnZh9/nPEH72VI03X9Mv7NqMcKTOYAj+A7xjmk9RSLKad4tLbLrvFjwj
         rl9dlhGwIBAuv9DeuH6yg6JiULKWWtUP/09hbNzfdB6UqkUlnONtrUIyCslF+FHomQFj
         rbqJStucDLyMhWNfZFP8uXPQpXZlHppGpwkeBsjmGM5kFD/wrM3OW86DPTNFJhKQSZzq
         hBqg==
X-Forwarded-Encrypted: i=1; AJvYcCXPgP2gcQM2R70yBUQTb2kDTkXkut+QOI4yxqX5kh9satB+D4eo/dM6omGTJGFWcw6NJ/gEvOPJfyYBBEVC@lists.linux.dev
X-Gm-Message-State: AOJu0YzgOH61ycoxsocL3Z6K1gHpGdkEy3C2SQMvx5hc90hXm3fYPz87
	eMMHphkMmsS0PwFca0fdArNE6JaOhsj4BE4DY63+kuxfUJZb+1Go
X-Google-Smtp-Source: AGHT+IFAAaO3TKq+C1WNJYpQIKHj+UFL4SJewCj5VAQhdolGuWTfVwKSh5SAxU3kyuBD9UZ1P9d39A==
X-Received: by 2002:a05:6214:4801:b0:6c3:5ebb:9524 with SMTP id 6a1803df08f44-6cb3b64cde3mr165977926d6.48.1727653067571;
        Sun, 29 Sep 2024 16:37:47 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b5ff61esm35031206d6.21.2024.09.29.16.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 16:37:47 -0700 (PDT)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8B10D1200043;
	Sun, 29 Sep 2024 19:37:46 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Sun, 29 Sep 2024 19:37:46 -0400
X-ME-Sender: <xms:yuT5Zr-jAYnuaebFFRujlYtnZXM3IB_XIkBj-0IMty_X1ko850nBAg>
    <xme:yuT5Zntu2qwP-9U-KS-iX40-OrLhEjJkSiVyIGP2dyACxFe5HAnizyBcS4lR_CATu
    Oft6_6LedPgKfvGyg>
X-ME-Received: <xmr:yuT5ZpDkB1OlVrNDor54BV9yKq-lKAmTz4t6gZ2BCRA98qUvwcJJM0tM0ws>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddugedgvdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvve
    fukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepuehoqhhunhcuhfgvnhhguceo
    sghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrhhnpedvvd
    efjedvudefgeehvdelueehjeeiheevveffkeevfedtffdtieehtdekieefueenucffohhm
    rghinhepkhgvrhhnvghlrdhorhhgpddtuddrohhrghdpghhithhhuhgsrdgtohhmnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdo
    mhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejke
    ehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgr
    mhgvpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhope
    gsohhtthgrrgifvghsohhmvgeifeefsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhk
    phesihhnthgvlhdrtghomhdprhgtphhtthhopehovgdqkhgsuhhilhguqdgrlhhlsehlih
    hsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepsghoqhhunhesfhhigihmvgdrnhgr
    mhgv
X-ME-Proxy: <xmx:yuT5ZncdWUtNeShbYdCvbwYz0dgWhp5vvgXlPsjEec4SKMX2fJJD_g>
    <xmx:yuT5ZgM6Yr0tAvQ1qJwfhgoIqTwFSPj27WWb53YtcaGTHo_EKHt3QQ>
    <xmx:yuT5ZpkBnHg-q2eK3FkkycQxhTB1lNvOiNUS0GvHZse4P8nll_jlwA>
    <xmx:yuT5Zqu1hR2wS68PZGsnPLejPtcU42Zgxh39tr3OEFHpK9pHGLubfw>
    <xmx:yuT5ZqvIen-ugjsBLqiV7w23C3ygVZzNLBHP4P1vOozPsxm3lDsd4L0Q>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Sep 2024 19:37:45 -0400 (EDT)
Date: Sun, 29 Sep 2024 16:36:50 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: ahmed Ehab <bottaawesome633@gmail.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [boqun:lockdep-for-tip 3/3] lib/locking-selftest.c:2713:5:
 sparse: sparse: undefined preprocessor identifier 'CONFIG_DEBUG_LOCK_ALLOC'
Message-ID: <ZvnkkuKeDHS2QAUL@boqun-archlinux>
References: <202409291308.MTSMBIvg-lkp@intel.com>
 <CA+6bSavacZ0s4Xa7_MyO41nrL49LCjUyNVcwNv2JJaYpTZPfFQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+6bSavacZ0s4Xa7_MyO41nrL49LCjUyNVcwNv2JJaYpTZPfFQ@mail.gmail.com>

On Sun, Sep 29, 2024 at 11:43:39PM +0300, ahmed Ehab wrote:
> On Sun, Sep 29, 2024 at 8:27 AM kernel test robot <lkp@intel.com> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git
> > lockdep-for-tip
> > head:   1c4aa09f488868163ce3e23df93a68610303f6af
> > commit: 1c4aa09f488868163ce3e23df93a68610303f6af [3/3] locking/lockdep:
> > Add a test for lockdep_set_subclass()
> > config: hexagon-randconfig-r121-20240929 (
> > https://download.01.org/0day-ci/archive/20240929/202409291308.MTSMBIvg-lkp@intel.com/config
> > )
> > compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project
> > 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
> > reproduce: (
> > https://download.01.org/0day-ci/archive/20240929/202409291308.MTSMBIvg-lkp@intel.com/reproduce
> > )
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new
> > version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes:
> > https://lore.kernel.org/oe-kbuild-all/202409291308.MTSMBIvg-lkp@intel.com/
> >
> > sparse warnings: (new ones prefixed by >>)
> > >> lib/locking-selftest.c:2713:5: sparse: sparse: undefined preprocessor
> > identifier 'CONFIG_DEBUG_LOCK_ALLOC'
> >    lib/locking-selftest.c:310:1: sparse: sparse: context imbalance in
> > 'AA_spin' - wrong count at exit
> >    lib/locking-selftest.c:312:1: sparse: sparse: context imbalance in
> > 'AA_wlock' - wrong count at exit
> >    lib/locking-selftest.c:314:1: sparse: sparse: context imbalance in
> > 'AA_rlock' - wrong count at exit
> >    lib/locking-selftest.c:333:13: sparse: sparse: context imbalance in
> > 'rlock_AA1' - wrong count at exit
> >    lib/locking-selftest.c:339:13: sparse: sparse: context imbalance in
> > 'rlock_AA1B' - wrong count at exit
> >    lib/locking-selftest.c:359:13: sparse: sparse: context imbalance in
> > 'rlock_AA2' - wrong count at exit
> >    lib/locking-selftest.c:371:13: sparse: sparse: context imbalance in
> > 'rlock_AA3' - wrong count at exit
> >    lib/locking-selftest.c:740:1: sparse: sparse: context imbalance in
> > 'double_unlock_spin' - unexpected unlock
> >    lib/locking-selftest.c:742:1: sparse: sparse: context imbalance in
> > 'double_unlock_wlock' - unexpected unlock
> >    lib/locking-selftest.c:744:1: sparse: sparse: context imbalance in
> > 'double_unlock_rlock' - unexpected unlock
> >    lib/locking-selftest.c:771:1: sparse: sparse: context imbalance in
> > 'init_held_spin' - wrong count at exit
> >    lib/locking-selftest.c:773:1: sparse: sparse: context imbalance in
> > 'init_held_wlock' - wrong count at exit
> >    lib/locking-selftest.c:775:1: sparse: sparse: context imbalance in
> > 'init_held_rlock' - wrong count at exit
> >    lib/locking-selftest.c:2510:1: sparse: sparse: context imbalance in
> > 'RCU_in_HARDIRQ' - wrong count at exit
> >    lib/locking-selftest.c:2511:1: sparse: sparse: context imbalance in
> > 'RCU_in_NOTTHREADED_HARDIRQ' - wrong count at exit
> >    lib/locking-selftest.c:2517:1: sparse: sparse: context imbalance in
> > 'RCU_in_SOFTIRQ' - wrong count at exit
> >    lib/locking-selftest.c:2574:1: sparse: sparse: context imbalance in
> > 'RCU_in_RCU' - wrong count at exit
> >    lib/locking-selftest.c:2574:1: sparse: sparse: context imbalance in
> > 'RCU_in_RCU_BH' - wrong count at exit
> >    lib/locking-selftest.c:2574:1: sparse: sparse: context imbalance in
> > 'RCU_in_RCU_SCHED' - wrong count at exit
> >    lib/locking-selftest.c:2574:1: sparse: sparse: context imbalance in
> > 'RCU_in_raw_spinlock' - wrong count at exit
> >    lib/locking-selftest.c:2574:1: sparse: sparse: context imbalance in
> > 'RCU_in_spinlock' - wrong count at exit
> >    lib/locking-selftest.c:2574:1: sparse: sparse: context imbalance in
> > 'RCU_in_mutex' - wrong count at exit
> >    lib/locking-selftest.c:2510:1: sparse: sparse: context imbalance in
> > 'raw_spinlock_in_HARDIRQ' - wrong count at exit
> >    lib/locking-selftest.c:2511:1: sparse: sparse: context imbalance in
> > 'raw_spinlock_in_NOTTHREADED_HARDIRQ' - wrong count at exit
> >    lib/locking-selftest.c:2517:1: sparse: sparse: context imbalance in
> > 'raw_spinlock_in_SOFTIRQ' - wrong count at exit
> >    lib/locking-selftest.c:2575:1: sparse: sparse: context imbalance in
> > 'raw_spinlock_in_RCU' - wrong count at exit
> >    lib/locking-selftest.c:2575:1: sparse: sparse: context imbalance in
> > 'raw_spinlock_in_RCU_BH' - wrong count at exit
> >    lib/locking-selftest.c:2575:1: sparse: sparse: context imbalance in
> > 'raw_spinlock_in_RCU_SCHED' - wrong count at exit
> >    lib/locking-selftest.c:2575:1: sparse: sparse: context imbalance in
> > 'raw_spinlock_in_raw_spinlock' - wrong count at exit
> >    lib/locking-selftest.c:2575:1: sparse: sparse: context imbalance in
> > 'raw_spinlock_in_spinlock' - wrong count at exit
> >    lib/locking-selftest.c:2575:1: sparse: sparse: context imbalance in
> > 'raw_spinlock_in_mutex' - wrong count at exit
> >    lib/locking-selftest.c:2510:1: sparse: sparse: context imbalance in
> > 'spinlock_in_HARDIRQ' - wrong count at exit
> >    lib/locking-selftest.c:2511:1: sparse: sparse: context imbalance in
> > 'spinlock_in_NOTTHREADED_HARDIRQ' - wrong count at exit
> >    lib/locking-selftest.c:2517:1: sparse: sparse: context imbalance in
> > 'spinlock_in_SOFTIRQ' - wrong count at exit
> >    lib/locking-selftest.c:2576:1: sparse: sparse: context imbalance in
> > 'spinlock_in_RCU' - wrong count at exit
> >    lib/locking-selftest.c:2576:1: sparse: sparse: context imbalance in
> > 'spinlock_in_RCU_BH' - wrong count at exit
> >    lib/locking-selftest.c:2576:1: sparse: sparse: context imbalance in
> > 'spinlock_in_RCU_SCHED' - wrong count at exit
> >    lib/locking-selftest.c:2576:1: sparse: sparse: context imbalance in
> > 'spinlock_in_raw_spinlock' - wrong count at exit
> >    lib/locking-selftest.c:2576:1: sparse: sparse: context imbalance in
> > 'spinlock_in_spinlock' - wrong count at exit
> >    lib/locking-selftest.c:2576:1: sparse: sparse: context imbalance in
> > 'spinlock_in_mutex' - wrong count at exit
> >    lib/locking-selftest.c:2577:1: sparse: sparse: context imbalance in
> > 'mutex_in_RCU' - wrong count at exit
> >    lib/locking-selftest.c:2577:1: sparse: sparse: context imbalance in
> > 'mutex_in_RCU_BH' - wrong count at exit
> >    lib/locking-selftest.c:2577:1: sparse: sparse: context imbalance in
> > 'mutex_in_RCU_SCHED' - wrong count at exit
> >    lib/locking-selftest.c:2577:1: sparse: sparse: context imbalance in
> > 'mutex_in_raw_spinlock' - wrong count at exit
> >    lib/locking-selftest.c:2577:1: sparse: sparse: context imbalance in
> > 'mutex_in_spinlock' - wrong count at exit
> >
> > vim +/CONFIG_DEBUG_LOCK_ALLOC +2713 lib/locking-selftest.c
> >
> >   2712
> > > 2713  #if CONFIG_DEBUG_LOCK_ALLOC
> >   2714  static inline const char *rw_semaphore_lockdep_name(struct
> > rw_semaphore *rwsem)
> >   2715  {
> >   2716          return rwsem->dep_map.name;
> >   2717  }
> >   2718  #else
> >   2719  static inline const char *rw_semaphore_lockdep_name(struct
> > rw_semaphore *rwsem)
> >   2720  {
> >   2721          return NULL;
> >   2722  }
> >   2723  #endif
> >   2724
> >
> > --
> 
> 
> Do I need to handle any of these warnings?
> 

No need this time, I will fix this on my side, seems you should use
#ifdef instead of #if.

Regards,
Boqun

> 
> >
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> >
