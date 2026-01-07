Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA7A227E82
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jan 2026 22:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767825359; cv=none; b=t1mYPvf4Qk6ChqHPgjycW5JHpppHDIZwnAcGztLlunu+z2ppHwds6NBfxLfvpGMKuqf23/vW7+dC9yBFJOb7wSHDRgwS6DnMDBmcn3V/JffPk0guPdCBs5WHFEXLYsnn33CmABbbZkipX331kwrv2FdYkgwTQKbBQOvgCxKjvqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767825359; c=relaxed/simple;
	bh=ULmBchf6uHG7XfIBwuSNSxuY3n7202c3I2ALiKzn+R0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iDIIdv2FXjzvbt8LF5kBe5OXVzG5RHXJNsmGLXoByF4Bw53TbV7GU23hEgTFWbCjw+HZc5sdP/Z5CYMBOsswLU4vBOLoNOXJIQ7rO1Vt7yKccDCxNcXdVFihxg2ue/e2oD8frd8UvrSYS9VzJMbxS9f4tqvL9K0JdzT+mKYrkRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M/zFGfJw; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M/zFGfJw"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47a8195e515so18496005e9.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 07 Jan 2026 14:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767825356; x=1768430156; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9MiZFSPD82hskHJGo8vPrqD+VrxaQeEjeDDULZM5E4=;
        b=M/zFGfJwRhPtfvXw9ucf/JWrtEWbyEEwQo7rCdf+ktGF9lCSntCmjHO8ep8xUoJwaZ
         PsJNItBl9CG5qDWojIDv25bOU+wMuL2TcsYhGwWNNzTuqc+rCgCq6ZqmYPvPVZCfSwzF
         2vz35AxUMBwtsjo1PS0kIHqysbND82+G0EOOMefdJaGnmN2Mf3a3vGAfLD7Alj/XkZTl
         THhF7wPDqWSBHIDoF4n+ZwKQ/Fn4NTAofZM8nQmtr9aWGneF3KYg+RxUe3zI8PdgCg1Y
         xVznBO7naO1kxrS6oOIyghWwuTQyCxJw+ucEJ7Sa1GehjbFQ2snKvV5TRQ9MisE6qjDs
         PZ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767825356; x=1768430156;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I9MiZFSPD82hskHJGo8vPrqD+VrxaQeEjeDDULZM5E4=;
        b=lPNP0sxskq3/kegUdRcv87CO879XOdty3N4WLlAr7eDNhHgyoqzrRJ98qP3aYKgDOM
         KrLdkDp3r+1gGotYGqDm0zOJVgM92wxdjxmEAqEMtPmmHSB6Jt5gOUwxBT2Uv5C3EMYC
         LR1ZUq7Hb4VOGOn55gHqYETg0t1HuP90DtVxniXpZ4SkMtMPUtWX/2clFEspaWrmGatb
         hN5rJ+8a6RC0P/g7DRBSm4Em7kgHILYo6/+u96q302ejXxq8XP7BKCL9uaAUZu8YQPaH
         3ZoQ1ZBqF1mspBDW61JBLC3MHLaw/iFFMckI+TT5FHRbM9sq4bkDjh9mE7iqkAyhi8Bm
         UXEg==
X-Forwarded-Encrypted: i=1; AJvYcCXWybmqJo3Gy8SfHpeOudRELew9iz19yim5w9srjdkBb3/zK3yVriXzU4EK36kdmKJXLbwtg4nGAUWGZY8c@lists.linux.dev
X-Gm-Message-State: AOJu0YyYeHvkBZVdxRzPnjB8bLWmk1/z1CjEAf3WJsfCZsYTF5adkMub
	5jPHhjejwdckfdbBTslOElK3CU9FrQNpcKEjZ5kQafw+kZhXrVSEgnI4mjl7H3y0QA==
X-Gm-Gg: AY/fxX4yWOFBxmWOB6l4VExLCOOp3sd7wgn/pa+YBBt5pOL2zm93lQOEG8Br3uhm70r
	PzcM9ECktk6XoWXe65ATVgXzEBmrH1KtZh5wIMM6nEqBzklZXCi9R+U2ta2x1JLaULwP5teu2se
	M+K2RgUDoQeI136QX25+V2t82FVBkmhTNEP2j4Lh4zP0VGfMezjNDSSESIy9a/DBA5691ZkeJ+V
	bjpneqUu3+YH6+J9V4YpoyhHY4mc/ZXTBFG5IIKhCA9bFHbTAQu+Z8OT6ftH0ytFuUQsVTei+xf
	YRoYPZOVAGb83508LLtaS5mM0lJ7MggzORFhQ5GuPc4OCdsPJFcEcnbrS63fdvrgm9FH4PQPXnz
	thZrAwgkCcgR7jaJZAn/agsbJU8bDJtZGLiJ7EIgkS/9iXB9/5NJ0Yw32EouSnZRDSoHvk4oUef
	TGenQQoGoYPc/+oa9/wk11PpknaK26NhtAeMaMlYxb9cnljLnf
X-Google-Smtp-Source: AGHT+IFlEoM6JRzI7IiNy9+9C/cTW4RAjYS4ck2xzN/9UwCaqBPGf6WHgfA6GySM60F97MLXZYZaug==
X-Received: by 2002:a05:600c:1d14:b0:477:97c7:9be7 with SMTP id 5b1f17b1804b1-47d84b0a7bdmr48314495e9.1.1767825356467;
        Wed, 07 Jan 2026 14:35:56 -0800 (PST)
Received: from elver.google.com ([2a00:79e0:2834:9:d454:8bcd:b3a3:f166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8660be14sm24488905e9.1.2026.01.07.14.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 14:35:55 -0800 (PST)
Date: Wed, 7 Jan 2026 23:35:49 +0100
From: Marco Elver <elver@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Heiko Carstens <hca@linux.ibm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [peterz-queue:locking/core 34/39] WARNING: modpost: EXPORT
 symbol "stack_depot_save_flags" [vmlinux] version generation failed, symbol
 will not be versioned.
Message-ID: <aV7fxXjaOBtHhI9X@elver.google.com>
References: <202512222219.F6EkVNmQ-lkp@intel.com>
 <20260105153520.GV3707891@noisy.programming.kicks-ass.net>
 <20260107114608.10536C6a-hca@linux.ibm.com>
 <20260107204549.GA846948@ax162>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107204549.GA846948@ax162>
User-Agent: Mutt/2.2.13 (2024-03-09)

On Wed, Jan 07, 2026 at 01:45PM -0700, Nathan Chancellor wrote:
> On Wed, Jan 07, 2026 at 12:46:08PM +0100, Heiko Carstens wrote:
> > On Mon, Jan 05, 2026 at 04:35:20PM +0100, Peter Zijlstra wrote:
> > > > commit: ee771bab5add646af678f7a40b6272c21a0964d7 [34/39] stackdepot: Enable context analysis
> > > > All warnings (new ones prefixed by >>, old ones prefixed by <<):
> > > > 
> > > > >> WARNING: modpost: EXPORT symbol "stack_depot_save_flags" [vmlinux] version generation failed, symbol will not be versioned.
> > > > Is "stack_depot_save_flags" prototyped in <asm/asm-prototypes.h>?
> > > > >> WARNING: modpost: EXPORT symbol "stack_depot_save" [vmlinux] version generation failed, symbol will not be versioned.
> > > > Is "stack_depot_save" prototyped in <asm/asm-prototypes.h>?
> > > 
> > > Heiko, I'm seeing these warnings, and I can reproduce in a local build.
> > > But I have to note that its just one more of an already existing string
> > > of similar failures.
> > > 
> > > I don't see anything like this on x86, not have I had robot reports for
> > > other architectures. As such, I'm considering this a pre-existing s390
> > > issue.
> > > 
> > > Please let me know if this is something you want me to look at
> > > nevertheless.
> > 
> > Sorry, to be more precise: I haven't seen anything like this before on s390.
> > All other occurences are also new and come with EXPORT_SYMBOL statements
> > within files where context analysis has been enabled.
> > 
> > When enabling CONFIG_MODVERSIONS I see this also for x86 builds.
> > 
> > I assume you cannot see this error pattern for s390 builds with
> > context analysis disabled?
> 
> Something about the context analysis makes genksyms fall over, running
> it manually on kernel/sched/core.i with '-w' to show warnings reveals
> many new "syntax error" instances. I don't see any warnings when using
> gendwarfksyms. Maybe it is context_lock_struct, as that is the first
> error I see in the list:
> 
>   include/linux/spinlock_types_raw.h:14: syntax error

This works:

--- a/include/linux/compiler-context-analysis.h
+++ b/include/linux/compiler-context-analysis.h
@@ -6,7 +6,7 @@
 #ifndef _LINUX_COMPILER_CONTEXT_ANALYSIS_H
 #define _LINUX_COMPILER_CONTEXT_ANALYSIS_H
 
-#if defined(WARN_CONTEXT_ANALYSIS) && !defined(__CHECKER__)
+#if defined(WARN_CONTEXT_ANALYSIS) && !defined(__CHECKER__) && !defined(__GENKSYMS__)
 
I guess the genksyms parser just can't deal with some of the syntax
(just like __CHECKER__).
