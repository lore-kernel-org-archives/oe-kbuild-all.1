Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E3235EDC1;
	Wed, 14 Jan 2026 21:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768426030; cv=none; b=daIgwA8FydOZiDDxRPUZ9QhODya44QsDEBH2lOmDe2zTb9RqPWNMNX3Y76hzbNrDa5IhQNjkp9UUPpgMKWAeYh4CkUnFB7muho4XiNUtod6Oz5bNrg819pog4dQEQ1NbhVrBObOMH2uh1oQkye/zys6LNiG+yOawyzOMVUEqjQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768426030; c=relaxed/simple;
	bh=yrqp0vTy+QAxoE9wVgyhL68KzAG33QgOyQXRuYSNWUU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kZfA+8Cw06siWUN/CIh9xujn90Z/cNbKXixAR1MrmJh6Dj5GSaNhtyF7wfp2+ke7fk1cLAbPPQGX7S9ObhOeRxNCYXUdFLAkagolMOYFPfyp+KKqjH132Epr/X/g7PF/K8oDohn7QyDxqm/rvs0raOgTJGvhBUrGmn8Jd8kOMfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HRRAK19H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HRRAK19H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E20ADC19421;
	Wed, 14 Jan 2026 21:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768426030;
	bh=yrqp0vTy+QAxoE9wVgyhL68KzAG33QgOyQXRuYSNWUU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HRRAK19H/J4A+cBWIq+gG3Hd7DIk4hf0uxK2kgwWTA+tsjdna26o6YoHbgbfuoX2h
	 XKTe2B/Iu41vRhm7WvmSyD+n92beFAHS5VEjF65PMRRHoO6vtWK+1i+6707Wu2TTAL
	 qxWwXt5rx+qzp5hOZfUi4DYEpyKQX4qEcCUYS5QdHIbwylbDHTTKAgW61GwtTAygfw
	 Ce2r8cr8g+HhArs7XishOIM/YyKHMF4/y0t8WrIuWrUSM/K3+nh5D9tbKbt5lnY0jN
	 MxT2pVpeIX+fhaadz7Fc1EtnzUitmgd3fZLXTRiURre+53C7TY+x62QDmNUTcKjzU6
	 5ReAJUs5nM2IQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, x86@kernel.org
Subject: Re: [tip:timers/vdso 12/14] net/rds/ib_cm.c:96:35: sparse: sparse:
 incorrect type in argument 1 (different modifiers)
In-Reply-To: <CAP-5=fVGnY37bCOUHx_tCgQ=K55CcSOzs98Hg2Mh7KF4Mbya+g@mail.gmail.com>
References: <202601150001.sKSN644a-lkp@intel.com>
 <CAP-5=fUyAtf9PQqYvagByK+-=-mN-T1zuLmxuvsPFVVHT3qLXA@mail.gmail.com>
 <874ioohsft.ffs@tglx>
 <CAP-5=fVGnY37bCOUHx_tCgQ=K55CcSOzs98Hg2Mh7KF4Mbya+g@mail.gmail.com>
Date: Wed, 14 Jan 2026 22:27:06 +0100
Message-ID: <871pjrj36d.ffs@tglx>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14 2026 at 13:03, Ian Rogers wrote:
> On Wed, Jan 14, 2026 at 12:04=E2=80=AFPM Thomas Gleixner <tglx@kernel.org=
> wrote:
>> > My preference would be 1 as I have a suspicion I played 2 and thought
>> > the non-const cast was best (hence it being in the patch) given other
>> > issues.
>>
>> Preferences based on suspicions are not really usefull. Please go and
>> figure out what's going on and either fix it in the kernel code or tell
>> the sparse folks what they are missing.
>>
>> Leaving it unresolved and handwaved away is not an option.
>
> I'd like to call this option, play a bunch of wac-a-mole but then

I'm not familiar enough with internet slang, but to my limited knowledge
it's spelled 'Whack-a-mole'. That aside:

     "Whack-a-mole" without a real conclusive explanation is really a
      lame excuse, actually it's beyond lame.

> still don't really progress. I had tried out I believe all the options
> 6 months ago where the builds were clean. There's always 1 more tool
> that's going to raise its head and complain about types, my motivation
> remains clang and gcc for user space copies of this code so we don't
> need to propagate -fno-strict-aliasing into places like perf.

So because your motivation ends there and other tools which raise their
ugly heads are not relevant to you ...

> Tbh, I'm not going to be able to look at this for a while so I'd
> suggest just dropping the patches.

... everything stays with the status quo, i.e. unresolved.

That makes a lot of sense - NOT!

Thanks for wasting my time to deal with your patches and welcome to my
extremly short ignore list!

Your's grumpy

       Thomas



