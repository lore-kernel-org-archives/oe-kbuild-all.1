Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EBE45FFCB
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Sep 2026 16:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788626639; cv=none; b=pA5GQtYrdUxZaLRaRmiG8EgIbE88dRP0stEZ72w58EFe86xxI1Hbb6i8rRqPhQO1sFi5dwZ8kFjc5DhK9I+JALt/Nz0uvVd4SqGdlC2xnyYRXkiRg49//YFwp3jpgxeIY2w/5MY1qSq9l96No9pFDxe+uhNggGnde8m2vbarJAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788626639; c=relaxed/simple;
	bh=VPVTdDOschktWqxbnpp2g+Cs7HVkwD6zFitEv4L4s6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJO177mWKQNEGDN6JtbrVz4Rm7YbH+63FVqEV6llmKCCaQBD6kkJrDOB4rTCmBGsewAe+7XZUf0IeU/uObHp4w5wxOE+nGUPzvaI3dTkiOH+hoQW0bQW+okJjJWr5rqzf4VyfKBlQncuCaRNWAE/R1e8WSg2s7vi5345F0D9BJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=jLFyKyOB; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="jLFyKyOB"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5276d598b96so21343021cf.3
        for <oe-kbuild-all@lists.linux.dev>; Sat, 05 Sep 2026 09:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788626636; x=1789231436; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2MnNWKE1aLOQVvI4VXrDjnmlyCcUk8F5PrqoE1ht1fY=;
        b=jLFyKyOBokUAOfTUhBm5v3y+ZOICDG5RffKyFke64+gY0zLjIw+7lX+PAyJDyjqOJf
         Pm19zj1KQBjva8RMesS+NbWYb4fjB0aBHlLdHICnTKmSAjedyUFhMOeZbM8m+i88rptQ
         YexyiuP4/837VeG7vV56i5M06pvQXNwqoWt8w4u50x6LUwZvkqSQ0UmuLqDicUxf9PHR
         CsHtunjk/pL3jr+UhwFb38qLzBVSc/kOZ05FNztOfTXnWNtw/QfBvHK1iJYeShNdVfq6
         mIBS6+prNtTRp6erVIaBQ23Q+dBsWWpwJ3u5Gs3uCg8UKUdg1SkTrErde0gK6PCzE7zG
         NNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788626636; x=1789231436;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2MnNWKE1aLOQVvI4VXrDjnmlyCcUk8F5PrqoE1ht1fY=;
        b=BuwunqCBmhXRnxNvewxMSyQ165lJRlsdjVNs/gMAdG24gFv9mE5qNUTG9ElSb0Xqrj
         7R03SofpRbjB8zeMiYj23OA9sv5Da9FOW7+8m0rWa6f4/MSYmXoTRCuQBnwAh00b99Sj
         xYhQdjITvh+K3YgVeiy0J2jPk1wejW85Zm7iU+IwbWodagZdNLcJFyrul9JvnDIWLkHd
         GmvoQfvmUmB8p0YSvwm5dXYMVvn1HAONcah28WjGcfmPOQ0tO2TtNxgEmrNsfErldlOc
         5ahGHBxl/lI7LegCL1Q9KPiTpGN7n7Bxi5ZNK17VcgyLXyV84omNmMJEPSNRTNjRn6HX
         NPuw==
X-Forwarded-Encrypted: i=1; AKwUvBx+En7gWcHZwpYThrwmQdPBRORqHQBh2CBzGDEsY0Nl3ENvOVeFzdSSNVm3hkycDRYAdMJbBPl2fI72mCI+@lists.linux.dev
X-Gm-Message-State: AFuF++kialLfndd/lpt7M8pla8Xfx3j9thAWrx6okPUsPBBFuzXPtG8Y
	1PidBQBNH1kKLTjoYN0uDx9lycmY5DFc1oaLSMhqr16Jd8ZWtuvXBo7VMt0pRne077I=
X-Gm-Gg: AYBFou3urMG5Q8agBKdWLNymukUT+532F8GJ9orZ9jy3i8RPhOJCskMvGxkdcXbPM7I
	6E2FIG5PUU16H23keN5CTbPWAt5W4x3+bYqRZBOXkA/6P99vF48XvXrRLToA/MgswZYp59rMHZ4
	bXFB5RmRg7BjqR78aF5QsytMEuqXaU4xgdUghLNyqdK16ysptutC2koTuSduiT9PQAZVhHN5+3Z
	SRGYb6IzXOCC8l1yro9fCCA2MDlpWB/bIV1ycZVM2tdzk+nBeW69ynyQ5RT/TNvNmiiLhQS9H5L
	rhtvdRB9lltumbbRuBlAXqaQfCJAFOBkW3gy0J08I9R+ghgDtbMGiYG/f5GjgOhpmW8Rg3DDdx3
	ZmPa8nASdUOsxsa6tQQpgHHBgJfGW/jK01H3WVxBmNWHNarZBz9R91P8bZjjyxjLpiiQDtLVyPA
	sBKUKpn35wkD8mKo/rsgB9x0/P1Qn7hKLdy3Zdf9Jqxg4QyooUdIvCf8VzEgOhuEolSMDXPuuba
	DKigvxPK5+i2pdtU7eAiCboVOxrG0LShT1qZngy+7rH
X-Received: by 2002:ac8:598e:0:b0:530:3140:f0f5 with SMTP id d75a77b69052e-530547e047cmr134840771cf.5.1788626635947;
        Sat, 05 Sep 2026 09:43:55 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530541c86f1sm46782371cf.24.2026.09.05.09.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 09:43:55 -0700 (PDT)
Date: Sat, 5 Sep 2026 12:43:53 -0400
From: Gregory Price <gourry@gourry.net>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	David Hildenbrand <david@kernel.org>, Linux Memory Management List <linux-mm@kvack.org>, 
	mm-commits@vger.kernel.org
Subject: Re: [akpm-mm:mm-new 301/316] mm/memory_hotplug.c:1507:13: warning:
 'node_is_memoryless' defined but not used
Message-ID: <apxGfmKgqnj0TDTn@gourry-fedora-PF4VCD3F>
References: <202609050628.ywCLhOj5-lkp@intel.com>
 <20260904185658.cb3316b1d54ab7320620c26f@linux-foundation.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904185658.cb3316b1d54ab7320620c26f@linux-foundation.org>

On Fri, Sep 04, 2026 at 06:56:58PM -0700, Andrew Morton wrote:
> On Sat, 05 Sep 2026 06:32:19 +0800 kernel test robot <lkp@intel.com> wrote:
> 
> > Hi Gregory,
> > 
> > FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
> > head:   e3fc12b08aadde9cec7b3799ac0e0c9a1aa245c4
> > commit: 77a622e07892674da28eb3ad349ddd96df10aded [301/316] mm/memory_hotplug: factor out node_is_memoryless()
> > config: x86_64-randconfig-161-20260904 (https://download.01.org/0day-ci/archive/20260905/202609050628.ywCLhOj5-lkp@intel.com/config)
> > compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
> > smatch: v0.5.0-9187-g5189e3fb
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609050628.ywCLhOj5-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202609050628.ywCLhOj5-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > >> mm/memory_hotplug.c:1507:13: warning: 'node_is_memoryless' defined but not used [-Wunused-function]
> >     1507 | static bool node_is_memoryless(int nid)
> >          |             ^~~~~~~~~~~~~~~~~~
> 
> Thanks.  Let me try this:

Thanks Andrew, sorry for the churn.

~GRegory

