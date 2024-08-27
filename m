Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553B61CF297
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Aug 2024 18:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724781662; cv=none; b=U7fVomCeFS2F/q4NmOFLyV15JQ5IeaGvGm5jRjpP1sWVfRctqs+5hVyPaQNSvNDQEm5nlayvQS+QQwwcq32rrrGkRjK7R4i87/F0C9JfHoOQsmmLFA8WF/ITc0astEqGUGw5jAxi4VDKTv2guhtApOBnlUwl4cR8mW2LyMwgPrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724781662; c=relaxed/simple;
	bh=c2xBtR+BsTJelqlilJWFgdmV1UZZD3UOaVzIWn6/YDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JSmCFuUX2mLFqUvKuLLyPUUr1Q4wS+rKuB4V7BawyK3WUsoD5dGx6W9awcUyIffHugN7JVxenv5VC3RUY1goPc7NeIjJ5BY/+rjHRgyylElRWVPjANN7DgYH+EOd6ukJd4pusYdh83pQFjy40ZV7thsKEp8aPR666AWwEzs4fDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2FWnJlX; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2FWnJlX"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7a4df9dc885so3015885a.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Aug 2024 11:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724781659; x=1725386459; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mU7rEV6F3ZA0YUMBJPfPkkK8EXsvhkq32UE7Wg/stSM=;
        b=H2FWnJlXCld7MgXxXpPzlv6RQdTWuJ8vN//qTJRgueHosclR+ZVI9MgIKIsD5+dNus
         F6h0r2ODYwlrL/rTzOppjgve9L7Y0DbQXDINukX3Itk6+LFsIC87yv586SNOSvnkIzFH
         YtfPgJhLv5lmpfNKPjPZfjkb6ciG8lWQ2kd/8kDi3xsDEiPl/hMGZiVf1Crf2dWkaINl
         E70QgUUde/a30pQ5Zkl7s+r1JcmPt8gON8iYYmEdJYd+qRLuNAGUyGCRZpkDsJFUknjh
         JriJ1DQ81/XvTzPa1Mw49KcqBmBJzcBeNmWFWIZDP+KToLZ/bNVUyXVyKe/86tT8k9sK
         TFTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724781659; x=1725386459;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mU7rEV6F3ZA0YUMBJPfPkkK8EXsvhkq32UE7Wg/stSM=;
        b=MDp0M2D9tz6NVRLQiL/PBHsbtTKq1kioqYcVkbq6jRd7Ez54SKS06MizETp+uFNTYZ
         79dy8dLT6vW7HZyHRLRlXcfK0ygTJseX1fYzocgE8/ZB0aZpAkq8iQxYwu1/tqScCJoI
         +Twxu0BOT3R8LIXKH3w8+6OeMehUXdikLEcexPG38YwiML0V7s9rKOfLMUZoKJOPXIer
         npVJKwp06yPcrG6ZZKwaHJ7T1SRaFHAVzFZ0/dS5pRju0TXbKGV8f1aMtsi4uimntCsP
         UQuzFWPaQ2MKcEWBEdHoGIId3afe/s+19GcL9s8F23rYdweyKSXxrGizOs4XnaLa+j8c
         WkuA==
X-Forwarded-Encrypted: i=1; AJvYcCW7a1SSA09hEttlzmt4J/HvhJCO729BZNxqfSdy6SLhaqu68JIthbyLj7eXx+upItP5uU8V05cpmbsVTcHT@lists.linux.dev
X-Gm-Message-State: AOJu0YyXDTNBhsocZ2N68wYLSo9ObV6jLI8jE/tgvnl3pmpONMpWHYUh
	ixtsTEqpRDCwXapm1MLy0f7rAz/JUvxB+KYRrS379+wel2krHtdy
X-Google-Smtp-Source: AGHT+IHMGn3vE4bmd2qRiL3QYM+3tpk60SO/OSnIYyt7YFcEgT7kSrgP8kVAhh6b4hORHiUOkcVGQQ==
X-Received: by 2002:a05:620a:bcd:b0:7a1:e49b:9461 with SMTP id af79cd13be357-7a7f2d17baemr6613285a.26.1724781658874;
        Tue, 27 Aug 2024 11:00:58 -0700 (PDT)
Received: from fauth2-smtp.messagingengine.com (fauth2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a67f3622fasm570565485a.70.2024.08.27.11.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 11:00:58 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.nyi.internal [10.202.2.46])
	by mailfauth.nyi.internal (Postfix) with ESMTP id DB88B120006A;
	Tue, 27 Aug 2024 14:00:57 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Tue, 27 Aug 2024 14:00:57 -0400
X-ME-Sender: <xms:WRTOZulah2zzraf2wMT1zqNpucF-NZLaf050_fxiKnKlOsXi8NU29w>
    <xme:WRTOZl0nEfbBWxLKsCkKaS7TQknN1qiAGSy6t82sfHc6VOJU8UPrqqlQOBVgl3njh
    shA_aU6mrukbDO40w>
X-ME-Received: <xmr:WRTOZsqoxxXIV5amHA4kGNjWnhFaG9aEu97bxW2HgVrmbblkMC8LZcLr5wkxrQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeftddguddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeevtddugeejgefggeekvdeigeduteelueev
    keejkefhieevffdvteeludffveefudenucffohhmrghinhepghhithdqshgtmhdrtghomh
    dpghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrghdptddurdhorhhgpdguvghppghm
    rghprdhnrghmvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledv
    geehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtoh
    hmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepuddupdhmohguvgepshhmthhp
    ohhuthdprhgtphhtthhopegsohhtthgrrgifvghsohhmvgeifeefsehgmhgrihhlrdgtoh
    hmpdhrtghpthhtoheplhhkphesihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhig
    qdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehovgdqkh
    gsuhhilhguqdgrlhhlsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepphgv
    thgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepmhhinhhgohesrhgvug
    hhrghtrdgtohhmpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehlohhnghhmrghnsehrvgguhhgrthdrtghomhdprhgtphhtthhopehlihhnuhigqd
    gvgihtgeesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:WRTOZinGw7LJ78tZrwAyM2NnyYZXEMHHJSe7LKseWCnyKkQWR8KL6g>
    <xmx:WRTOZs35c3lJqDJe197ghuRQXVocOKOryVFN7QDo2WBFieHTJ-eyAQ>
    <xmx:WRTOZpsmsnjBO-j0PdErZ18L57M-_0tEz9QisVPyeZbsGE467vTD1Q>
    <xmx:WRTOZoVDC-YAWslYXmP7uoR31khYcHEIypxVlDFw_Wcr-xc9wRliMg>
    <xmx:WRTOZn0Kwq4lRAzES1PlqRB2GkvO8rqs1hVV96bmkTR02BnOwB0lMMeL>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Aug 2024 14:00:56 -0400 (EDT)
Date: Tue, 27 Aug 2024 11:00:32 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: ahmed Ehab <bottaawesome633@gmail.com>
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, linux-ext4@vger.kernel.org,
	syzkaller@googlegroups.com
Subject: Re: [PATCH v6 2/2] locking/lockdep: Test no new string literal is
 created in lockdep_set_subclass()
Message-ID: <Zs4UQLbzOsmjhBGU@boqun-archlinux>
References: <20240824221031.7751-2-bottaawesome633@gmail.com>
 <202408270559.rym5UAv9-lkp@intel.com>
 <CA+6bSauLj9MBs_HRP6Yt9qXVs4eO30cpvU00u=uj7sG7S8fHmQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+6bSauLj9MBs_HRP6Yt9qXVs4eO30cpvU00u=uj7sG7S8fHmQ@mail.gmail.com>

On Tue, Aug 27, 2024 at 01:04:15PM +0300, ahmed Ehab wrote:
> On Tue, Aug 27, 2024 at 1:08 AM kernel test robot <lkp@intel.com> wrote:
> 
> > Hi Ahmed,
> >
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on tip/locking/core]
> > [also build test ERROR on tip/master arm-perf/for-next/perf linus/master
> > tip/auto-latest v6.11-rc5 next-20240826]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:
> > https://github.com/intel-lab-lkp/linux/commits/Ahmed-Ehab/locking-lockdep-Test-no-new-string-literal-is-created-in-lockdep_set_subclass/20240826-145215
> > base:   tip/locking/core
> > patch link:
> > https://lore.kernel.org/r/20240824221031.7751-2-bottaawesome633%40gmail.com
> > patch subject: [PATCH v6 2/2] locking/lockdep: Test no new string literal
> > is created in lockdep_set_subclass()
> > config: i386-buildonly-randconfig-003-20240827 (
> > https://download.01.org/0day-ci/archive/20240827/202408270559.rym5UAv9-lkp@intel.com/config
> > )
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce (this is a W=1 build): (
> > https://download.01.org/0day-ci/archive/20240827/202408270559.rym5UAv9-lkp@intel.com/reproduce
> > )
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new
> > version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes:
> > https://lore.kernel.org/oe-kbuild-all/202408270559.rym5UAv9-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    lib/locking-selftest.c: In function 'lock_class_subclass_X1':
> > >> lib/locking-selftest.c:2715:60: error: 'struct rw_semaphore' has no
> > member named 'dep_map'
> >     2715 |         const char *name_before_setting_subclass =
> > rwsem_X1.dep_map.name;
> >          |                                                            ^
> >    lib/locking-selftest.c:2719:47: error: 'struct rw_semaphore' has no
> > member named 'dep_map'
> >     2719 |         name_after_setting_subclass = rwsem_X1.dep_map.name;
> >          |                                               ^
> >
> These failures will only happen if CONFIG_DEBUG_LOCK_ALLOC is not set,
> which is required for lockdep I think.

Oh yes, this test can be compiled with LOCKDEP=n.

> Should I consider these errors by checking CONFIG_DEBUG_LOCK_ALLOC before
> calling my test method or is it
> irrelevant?
> 

Could you introduce a helper function here?

	#if CONFIG_DEBUG_LOCK_ALLOC
	static inline char* rw_semaphore_lockdep_name(struct rw_semaphore *rwsem)
	{
		return rwsem.dep_map.name;
	}
	#else
	static inline char* rw_semaphore_lockdep_name(struct rw_semaphore *rwsem)
	{
		return NULL;
	}
	#endif

and use it in your test case (you put the function definitio right
before the test case.

Regards,
Boqun


> >
> >
> > vim +2715 lib/locking-selftest.c
> >
> >   2712
> >   2713  static void lock_class_subclass_X1(void)
> >   2714  {
> > > 2715          const char *name_before_setting_subclass =
> > rwsem_X1.dep_map.name;
> >   2716          const char *name_after_setting_subclass;
> >   2717
> >   2718          lockdep_set_subclass(&rwsem_X1, 1);
> >   2719          name_after_setting_subclass = rwsem_X1.dep_map.name;
> >   2720          DEBUG_LOCKS_WARN_ON(name_before_setting_subclass !=
> > name_after_setting_subclass);
> >   2721  }
> >   2722
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> 
> 
> Regards,
> Ahmed
