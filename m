Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3150B372EEA
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Apr 2026 19:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775156964; cv=pass; b=LPZWMhCBo09hCKGTfkyEs/fEP44pKu4I7pGI6RFo0NeU4YlxPcnnilJFVCRzeXBWASNZ8955FDK13H0yGXTYoEq6k/5XWa1ISvJCA7zVxmn6Bgn5xeBaZlCW+geOj/zxDUiWB0rAk3ETPj/wOJkzcUSgstI4asCaO6FWUIFz5LM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775156964; c=relaxed/simple;
	bh=AkTXuskHgqFSHuPaesiQpEtKQBcqndFo0G825t42ZQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I/0axHeI3UEwwUyR1hFD7aJhs7wQ5Kx+WzYqAFuuxeS/HRQRUo81c4Qa23zMUj0cUHFdYis3ipvUPna38VpzeBDwe4XvRkOVukUrEvGi/wb8cKLpzT5Bbq1uiLlujLKBBW8p/fwQLG0FCuyHSTmHK1uPVKMv3zr1kDfAvd06Rt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WGk8jE1y; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WGk8jE1y"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12732165d1eso1884872c88.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 02 Apr 2026 12:09:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775156961; cv=none;
        d=google.com; s=arc-20240605;
        b=L/i6taKfoDUSG60EiBBPjb32djbPVK6jTIiU5MFfWG8F4zsW1Hm5EBOa755CUtS9y5
         b9IcODj6QEhDJ02xvAy3AbB+klM0oLjHrovmgr/r0lKHbjzRtUopc469hqAOWoRNZ+yd
         SWibVqp2Xa6+QdbwrSa9Y7P/gNmQmjf0DeFx3UNVKdXdX7/r/FO1vZiBbH9Dh180in5O
         2ju0tatR425YYzahKPY1PIBGCBoF28Uu48CeETVepVszlnACkalGU68U78FBq9v4+X+C
         SL8WC1XtD3am1eixd72pgxmrVT+bq03LJcSRWCrlfRBUULecLO7FWwz2/dXh2Yog0zal
         dPfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=26jnDOH9sfu0NBZTRbOR7+Wdjzvvt/AkBoHu3e7kTgM=;
        fh=xr0J4XBJRleevxNkjh9TyjOuqxuoXU6fpG6XbQ7go0s=;
        b=Hfe//KbCcMTrhBjJ9dfDNTIClM/DXf6Lur7tXiHg9fbSAs9YrBIRyS0JHcJ1ZcArjM
         WZte4Ih+mP0mKhejXLryhJbsNgiPzeySdavVkoGl2//wG6rF4ONVuWZACIq4fMhaOaEs
         oVwBPtM5Lyn6z1Jcak7nD4PVOqklnEjKxan0Q57fO9X05K4dz1qXCCM613ixN0jcYGt+
         rpRfUWugCCGCvhuXwuEWiGK8oB2A6+mtQpGxTZn6iS5hdaTlWUhnaTnCZ+aO+3Jsu4X7
         5T+uZZzQMbM0QWv9VSbmrBuj+CYoYwPNjGjvaKUzccFm+ep06rXBw/WPTiRvgtn/Gt7j
         XTcQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775156961; x=1775761761; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=26jnDOH9sfu0NBZTRbOR7+Wdjzvvt/AkBoHu3e7kTgM=;
        b=WGk8jE1yHtnQANKNB+MX75KoMoWc0IpoLsdHL3NfgYtvC+Sv/D+JO5eVG0gCGF0RBG
         4iY+I6nvXFGxbojVv7DZrMqbRanTlAb9IzDXOmnJOjh2Ad1KfTQ8KtmEsiHcDREfnot6
         CUMv00uVAZmeOmQ86yTWFOlo+G1fBbCNoU1MFmW69Ppvsg9Tt8pV/chZsn18NLSUNjfO
         beQcQ64nV/rxKdlDNFScAgeyyTPE8YAyckIGZchradwETOn2xtvoKvwuzeNq6DbN3NaO
         BreCY9M1iycFW36kDXK1IG0O+daAafBKxUjxYi+BSm6uTUtCCmVQp7NghxmSxhTe2sOv
         /KBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775156961; x=1775761761;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26jnDOH9sfu0NBZTRbOR7+Wdjzvvt/AkBoHu3e7kTgM=;
        b=CDIAz6ZCtey2L9D/KSTqTE2iJt82DDeJ02PGxDGtMV0oPVr7w9ixs5vsGs3zoELbzg
         B0OFnfIcq0EtN/DCyjs8i9CD4X5nueQf59rbdNGO7mfnNC9DERZaqikW1qMg495P8hAP
         FSk/YHPxQOXhKscBspcqWKKilPwHhMeb+JLFXYRmrqo5NcGfrYHDOB1S3H8BWTDX0DOQ
         KyZZaM7N59gc501h67toRhm6g2WBz8xr/4jMHRLKP5dAKVwWVb/JutzauIh/UQvo0PmU
         q7llpajlcqwy9yU9DWFBpq/K7VWUMojpqE0jK8lk8s+v2/f8TcRmP9tqNuBhZvYOsd5g
         QoAg==
X-Forwarded-Encrypted: i=1; AJvYcCXT4wRXWb7TtJlUf339H9Mv8oEEbUy64i6l2birm1t+Q2suQYxxPx63ZcGlPHjuABofW5HK9G7vWZbv1+ys@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+i/WRzJiBf1nNv0avWoGOkxFawkt2vTWwO43O269qTAQOPFTy
	nPs8Thf82N76uH3w6Y9L5+NJEAo658++ru0Oa4siI18TsIMc+Wc1Ob1a5eAN4nFju58SB1t7roV
	j89CI/DfLdJNn2tK+X9Sb+x74tLQa9i9Osjh3U1PR
X-Gm-Gg: ATEYQzwh/InhHbtmqjrmYsJE00vAZbxZ/N0fthetK0MQAAmgbMq4EeQf+l5qxDWjD3X
	pbDvMigcqH2A5/k+7QRD34N9HqveQ6HOEUH8Zy9uLpjjy2pSAwCXJgadC937qtev3mpTbATreyR
	wS6STTFK364lWCGgtF1stWMFypjIvcxy9kSReGBzrQTiMeLxIwz+Hvohhcg3z2FJN0G700miivE
	EmFfiWBbI0l8llUKWpNCeCwy2B68d+jzR3NQ/x8WX56vnW+yRuF/tiFSyvM0kCdgCQ6TfFCY+2j
	LYRhmV9cgYfX3dnDO/4dggj5OCxdAnKWfHnPT4hsvXgluG63xg==
X-Received: by 2002:a05:7022:ec17:b0:12b:ebb8:e518 with SMTP id
 a92af1059eb24-12bfb779d53mr79037c88.35.1775156960783; Thu, 02 Apr 2026
 12:09:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331111240.153913-1-elver@google.com> <202604020400.jEq32K95-lkp@intel.com>
 <CANpmjNOsM1e8jMvRKtEizMmZgPCCZ9YqpuZKad61Zg7PAGW7RA@mail.gmail.com> <ac6h2jF-KJ5pm1WM@stanley.mountain>
In-Reply-To: <ac6h2jF-KJ5pm1WM@stanley.mountain>
From: Marco Elver <elver@google.com>
Date: Thu, 2 Apr 2026 21:08:44 +0200
X-Gm-Features: AQROBzAm7ykm8zO9ipWjQHBso2-gdwz4n-a0cr85SYjLzctukNDeZ0kKGTltKIc
Message-ID: <CANpmjNPME07RK+jKnw233BYHX7wVMqCzFYpB2cSN4+DMgTSpuQ@mail.gmail.com>
Subject: Re: [PATCH v1] slab: support for compiler-assisted type-based slab
 cache partitioning
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, Vlastimil Babka <vbabka@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@linux-foundation.org>, Harry Yoo <harry.yoo@oracle.com>, 
	Hao Li <hao.li@linux.dev>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 2 Apr 2026 at 19:05, Dan Carpenter <error27@gmail.com> wrote:
>
> On Thu, Apr 02, 2026 at 03:48:20PM +0200, Marco Elver wrote:
> > On Thu, 2 Apr 2026 at 15:33, Dan Carpenter <error27@gmail.com> wrote:
> > >
> > > Hi Marco,
> > >
> > > kernel test robot noticed the following build warnings:
> > >
> > > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > >
> > > url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Elver/slab-support-for-compiler-assisted-type-based-slab-cache-partitioning/20260401-035608
> > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> > > patch link:    https://lore.kernel.org/r/20260331111240.153913-1-elver%40google.com
> > > patch subject: [PATCH v1] slab: support for compiler-assisted type-based slab cache partitioning
> > > config: um-randconfig-r072-20260401
> > > compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> > > smatch: v0.5.0-9004-gb810ac53
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Reported-by: Dan Carpenter <error27@gmail.com>
> > > | Closes: https://lore.kernel.org/r/202604020400.jEq32K95-lkp@intel.com/
> > >
> > > New smatch warnings:
> > > drivers/misc/lkdtm/heap.c:118 lkdtm_READ_AFTER_FREE() warn: potential pointer math issue ('base' is a 32 bit pointer)
> > > drivers/misc/lkdtm/heap.c:169 lkdtm_KFENCE_READ_AFTER_FREE() warn: potential pointer math issue ('base' is a 32 bit pointer)
> >
> > How is this related to the patch I sent? Did the <linux/slab.h> change
> > force rechecking of all these files and it found latent issues?
> >
>
> Oh, crud.  It turns out that for this check Smatch allows
> integer_array[sizeof()]so long as we know that the index is within
> bounds.  What happened is that your patch renamed the kmalloc()
> function so Smatch stopped knowing the size of the buffer.

Oh, I see. Smatch doesn't respect the __alloc_size attribute then?

> For these zero day bot warnings, the emails are automatically generated
> so I don't have any context outside what's in the email.  I saw that
> Kees wrote the code, but I figured maybe you forwarded it or something.
> Sorry about that.

No worries and thanks!
