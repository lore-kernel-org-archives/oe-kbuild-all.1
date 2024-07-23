Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1957C13C3F5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jul 2024 19:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721762747; cv=none; b=QKcXiUycwsU4ai5eZgj3a1Hk/W8QzJ0wCHTJx+16cZbkjQY2nGi9eb2g++8nzS7GfQs1vunDWvh6HofjSE/yAgCYbN6PoTNzujk9MvtMrp2pV2NukyEYvwdnjcdLrH04QAn82I5BLU9ssoL6fSUuzddCmOVmDEy0ybE9BcTheQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721762747; c=relaxed/simple;
	bh=HZt9krHOqkOGg3ksIsiY4ea2bMM2lQ6nwNkNyW7U4GE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nAi/f92dW2lp1pHxiFjA4N+xvcsHj4n7bJnbUCk/XX8ta7wcXPzO6IWP6rvb66BFEBq3NDMQi6185C+HBFU17m27G0QDb4BSibCMrwf3no5NKP0p0hde4/CslPQMStu7v6bmqaG3wadJkzw2R064NKIzpLLupk2lJ2bNqsrBF4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PELlLQHd; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PELlLQHd"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3d9ddfbbc58so3338883b6e.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jul 2024 12:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721762745; x=1722367545; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pui+9x9FoZL7DPEwk7OsZErD91Sf56G6xXu9R9mUzZw=;
        b=PELlLQHdZN9OOmP+Xku+BZNdU24bQ0Mk3UlhX3OLvBiEJAtax42+8jGqAM1/UYcGw6
         34fBgyqHXGJwFjtWJg1N12ioHy5k4TAf202bSk5xMFwW5pxMlzVP1kjWSx3jaqVrQAdj
         McL2E6uQ/VtJr8DhdsOwr+eyWeqoJSgiKibBgz9HyWQYtbprveTuS6lEVEoowRB0iEMb
         6GynkIVa+0PFyytyppt5m1CM1+9DUxP4lyEPqQMBhUcCJ70AupQQDGHrPXrL7xiJONkV
         8N9Sw+4s2blxFfsK/UfKoaLAhFfaMIm6Sdab1CFww/xMWXNZlXAXhadc0NvAu3l9x4qx
         M/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721762745; x=1722367545;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pui+9x9FoZL7DPEwk7OsZErD91Sf56G6xXu9R9mUzZw=;
        b=nssVVkgagE1liNhHqbdxxH5ohZeG+hxTlinHIOI6Ltgvsf0xrr9roOjyu5IsFD2S+o
         wS6rWGtUIUF8L9Ms3+hNAmK1l60Qfep2QZ7GUD4mAheqAxuU1MmNiRoZuMQAbRk1vWgd
         pGNCu1idg20UTRbc4Xx3fER6GCuCjK+pVPDxAoxqgH9PVjlzuL1+J66L5ZOzVnO+PAep
         NeiRQMZIXX2ReIMu4/iT/lU6VOSBsba3esdiRgro0D1Hwcv4b1hQkvRrpo13bUxLwXaH
         UFpF1AmYkjVZo6616VSZ2PfntP1STof6ipDik5HXLo6KvFMD++5EsKY3u6vYpZMJOltA
         5SiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuPpnhGJTQ5eoFCn7YjXFo0Fy+YJeT9a3t+hOUgXSxHeRVmB1Fj3vG/kEtmZiY2NV2bw2lhahiDKsB8YClTmvwGS930JtVP+EkuoEUKQ==
X-Gm-Message-State: AOJu0Yyo4Do0izRfPuCXB40SBQyfs3iD2Y8EovzMQmq97B/Of4+4Af7q
	aBy/Dt7qJB/l1al/SJf31TsWqT1Miu5SZVKgDESohU7CLL/XL/XDwbBsyrZWv+//9Jf91tgP2yJ
	YrOA=
X-Google-Smtp-Source: AGHT+IFK35cPinVU5a7QDczHk9xYaa/R1+E1cVI6qxjtLLNfAtfgGOQT0RHMXouRLR5H17+aGJtHcg==
X-Received: by 2002:a05:6870:8327:b0:261:1f7d:cf61 with SMTP id 586e51a60fabf-2638dee771dmr10166241fac.9.1721762745086;
        Tue, 23 Jul 2024 12:25:45 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:eca3:bb93:d28d:1005])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2610c76c74asm2308306fac.19.2024.07.23.12.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 12:25:44 -0700 (PDT)
Date: Tue, 23 Jul 2024 14:25:42 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [linux-next:master 13298/13495]
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:183 send_tlb_invalidation()
 warn: variable dereferenced before check 'fence' (see line 178)
Message-ID: <c8fd832d-c52e-4bfb-8448-b3bc4c5d8187@suswa.mountain>
References: <c8d58c8d-4e89-471b-853c-49d365d7f4d4@suswa.mountain>
 <Zp/9e5rwvQNvk2hg@DUT025-TGLU.fm.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zp/9e5rwvQNvk2hg@DUT025-TGLU.fm.intel.com>

On Tue, Jul 23, 2024 at 06:59:07PM +0000, Matthew Brost wrote:
> On Tue, Jul 23, 2024 at 01:52:46PM -0500, Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   dee7f101b64219f512bb2f842227bd04c14efe30
> > commit: 61ac035361ae555ee5a17a7667fe96afdde3d59a [13298/13495] drm/xe: Drop xe_gt_tlb_invalidation_wait
> > config: i386-randconfig-141-20240722 (https://download.01.org/0day-ci/archive/20240723/202407231049.esig0Fkb-lkp@intel.com/config)
> > compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202407231049.esig0Fkb-lkp@intel.com/
> > 
> > New smatch warnings:
> > drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:183 send_tlb_invalidation() warn: variable dereferenced before check 'fence' (see line 178)
> > 
> > vim +/fence +183 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > 
> > fc108a8b759f52 Matthew Brost        2023-01-17  159  static int send_tlb_invalidation(struct xe_guc *guc,
> > 332dd0116c82a7 Matthew Brost        2023-01-24  160  				 struct xe_gt_tlb_invalidation_fence *fence,
> > 332dd0116c82a7 Matthew Brost        2023-01-24  161  				 u32 *action, int len)
> > a9351846d94568 Matthew Brost        2023-01-17  162  {
> > a9351846d94568 Matthew Brost        2023-01-17  163  	struct xe_gt *gt = guc_to_gt(guc);
> > 501c4255c40935 Radhakrishna Sripada 2024-06-07  164  	struct xe_device *xe = gt_to_xe(gt);
> > a9351846d94568 Matthew Brost        2023-01-17  165  	int seqno;
> > a9351846d94568 Matthew Brost        2023-01-17  166  	int ret;
> > a9351846d94568 Matthew Brost        2023-01-17  167  
> > 61ac035361ae55 Matthew Brost        2024-07-19  168  	xe_gt_assert(gt, fence);
> 
> We assert the fence is not NULL here. It is invalid call with a NULL fence.
> 

This assert just does a drm_WARN().  It doesn't call called BUG() or
do anything that affects flow analysis.  These type of asserts are
deliberately ignored by Smatch.

With Smatch, I generally try not to print warnings about inconsistent
NULL checking when I know the extra checks are harmless.  If you had
cross function analysis enabled then possibly that would silence the
warning.  (This code is too new for me to have tested it on my own
system yet so I can't be sure if Smatch parses the callers correctly).

Unfortunately, cross function stuff doesn't scale well enough so we
can't use it on in the kbuild bot.

regards,
dan carpenter

