Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F9E33ADAF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 May 2026 10:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778927634; cv=none; b=Ptaf+PdfzixMfEyEDScmoa3Lgn/nsokJ3CYXsGFjbLzElt56d8wV5epph8iuUAp/67WnjFI/vTzF2rUjd+ngvFt61SoBD/lTGrBdyIEkky3rY+yWTnYhf7PoUKtWDrzhHOhU+2V1r/ig7QMbxzP0AywFZQ+DHRvu9U/8MM1xgaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778927634; c=relaxed/simple;
	bh=FuvtoQBugX7lKG59TCI3KMuu2qI+UzI10zjoRTYacFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=txi8Vip8RAYfM43y0dhBULp31Ty0bMe5mDI6R3JlpUYCvSSlRNGLwwiDT4qXwjL3vkLrJsqGScbnGE9YP4wFoeUdc2wJ3ulNDc6nQ6guqVBwgNZmPFG96Q9Q9d+TCoK0lQoPuW2rnYnnR1uFwiSErJfLETg54JR3d+FdPDYkZIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZjxhtH20; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZjxhtH20"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-44b330c5cc6so394338f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Sat, 16 May 2026 03:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778927631; x=1779532431; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tmDlgq0uLgD0NRXODmF5A8gxYBrdzp2qhaLJZG2Vx8s=;
        b=ZjxhtH2053twcRDV/xDsT1Cvc7TWI4Ait7ums4dM1c9CA8DbKB22+o0AjvIzPTdH+3
         cSe1pU0oIwuxXnbddP5MhxIp9d27SKlVngUydVeBUv9PT63GSrK5tPWbr9X3tkUMTx/o
         uSIA1181dZOTU9HM49AVMLLYTDe4q6thP/4NZsmdrq5HSQjffoIrbgHD50hM6RE9EPEF
         cAWpkjFiVlqGad3s1byx50WPBz7Gyci42CammSbWDzoQ85uf3TC4fU26n+kcw+11pITe
         g+YhbbNSJhqhzoS3474mHTdWtUye8FM1DQwAF+j4ShJugMxOJ8upTcbTh7Qfg25DT7yL
         rY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778927631; x=1779532431;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tmDlgq0uLgD0NRXODmF5A8gxYBrdzp2qhaLJZG2Vx8s=;
        b=QdQhnk8INBH3DFl1CbTV+DGUwhXfOrVHcXoL9EzpNx5NpBDcW4nN3wj4SIvyty3vMb
         52+8O0wJO+OBPblj4gCYT1nzV1UIHkROwWBf9nAyOgJjF8GlW2Bb3966kkaHUlewkfpn
         pUFEq+CKBXjpbcZtQIbxsNqWGKys3vgcy2FiCHOxEuKQODfWejJCUrP2Sgaufmf/2jsV
         /RF4kpdJTrmf4ojDHR/zV9EOn6ttnhZ0JyH9+lLUmmVyQ39kCnnKyBt1MEVU21enWyi/
         7Sxw/8Iod/e3tQZy7yfDZ56Kor/g8U5BZDXhEnGYdTnNR96EDdnyx3ZvPivboYjjaVH/
         IWRA==
X-Forwarded-Encrypted: i=1; AFNElJ83JQWsQ1CiA7U3azKTbH6edPm9usImDeWUorJbGRgpf3Z/Y7st2NDRG1WneysvWvvWw4D+N9Mm7j/k5BYu@lists.linux.dev
X-Gm-Message-State: AOJu0YwcJAFMklHo7N3QuMk1VSFrZ+3KJsXUCwJvzhor/6OwTVx7SnOF
	Zo4Z7rZwyP19ZbeHeGZwAKUENr00NZWLKsR0kFylgF5HryUvAOao58GbLKSnDE0I23w=
X-Gm-Gg: Acq92OFBiymfqBw4aVixghMo1x/rZT0H1DfLfUlA+Tw0UYEUcJpv+b4xpzg0hbafo5J
	dSzZrzJxUFzAViCbUpqz8RoBwfFYQ2fuIswydpBDtaX1Avh/V4yOm7eLbLuwoLxD/HssxFdj03I
	FE4Gm3M5I4qf55ri8Oba+79rj6LfDHAoZjm9cbVriEmvkeoOWqdgopK4gXYoNiDQOe/QqG8TbaB
	i/L32sxauRxiFzhc3jqyYszDWAHfEygXQKxdzQXZSHvMwrqUeCJt6BeqzJhQVtSX9DvNQT58cSj
	E61wISlW4hRa2oyUEBy2XY9T/eAPd3KwK9V5YyS+fZhn/kqtj3eCahTyvewshgc9e0s1zi0EQBl
	8kesMwlL6qlxOI0xybCv/eIVy99I21RliMEgZa1ZbvmYQjn6Y270vF+c46f0wm/E6HTA0XQdBGc
	Yc/YhNNv7l31K1q3tK5Ao7DB1NMrhTF5XX/yd+zQXDQ6FIXNhmNw4eA++tdm3CDKizQlpVLIRm1
	kYJPib6FJUdwbVn
X-Received: by 2002:a05:6000:d90:b0:45e:5c98:c8ed with SMTP id ffacd0b85a97d-45e5c98c926mr8135017f8f.21.1778927630643;
        Sat, 16 May 2026 03:33:50 -0700 (PDT)
Received: from localhost (brnt-04-b2-v4wan-170138-cust2432.vm7.cable.virginm.net. [94.175.9.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e767cb9sm20703655f8f.2.2026.05.16.03.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 03:33:49 -0700 (PDT)
Date: Sat, 16 May 2026 11:33:48 +0100
From: Stafford Horne <shorne@gmail.com>
To: Horst Birthelmer <horst@birthelmer.de>
Cc: kernel test robot <lkp@intel.com>,
	Horst Birthelmer <horst@birthelmer.com>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Horst Birthelmer <hbirthelmer@ddn.com>
Subject: Re: Re: [PATCH] dcache: add fs.dentry-limit sysctl with
 negative-first reaper
Message-ID: <aghIDLYW91C4fcd7@antec>
References: <20260514-limit-dentries-cache-v1-1-431b9eb0c530@ddn.com>
 <202605152333.0pOd2zJR-lkp@intel.com>
 <aggTg7OnEm175nSQ@fedora.fritz.box>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aggTg7OnEm175nSQ@fedora.fritz.box>

On Sat, May 16, 2026 at 08:55:16AM +0200, Horst Birthelmer wrote:
> On Fri, May 15, 2026 at 11:09:54PM +0800, kernel test robot wrote:
> > Hi Horst,
> > 
> > kernel test robot noticed the following build errors:
> > 
> > [auto build test ERROR on 5d6919055dec134de3c40167a490f33c74c12581]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Horst-Birthelmer/dcache-add-fs-dentry-limit-sysctl-with-negative-first-reaper/20260515-154600
> > base:   5d6919055dec134de3c40167a490f33c74c12581
> > patch link:    https://lore.kernel.org/r/20260514-limit-dentries-cache-v1-1-431b9eb0c530%40ddn.com
> > patch subject: [PATCH] dcache: add fs.dentry-limit sysctl with negative-first reaper
> > config: openrisc-randconfig-r073-20260515 (https://download.01.org/0day-ci/archive/20260515/202605152333.0pOd2zJR-lkp@intel.com/config)
> > compiler: or1k-linux-gcc (GCC) 10.5.0
> > smatch: v0.5.0-9185-gbcc58b9c
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605152333.0pOd2zJR-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202605152333.0pOd2zJR-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    fs/dcache.c: In function 'dentry_limit_worker_fn':
> > >> fs/dcache.c:1474:7: error: implicit declaration of function 'get_nr_dentry'; did you mean 'retain_dentry'? [-Werror=implicit-function-declaration]
> >     1474 |  nr = get_nr_dentry();
> >          |       ^~~~~~~~~~~~~
> >          |       retain_dentry
> >    cc1: some warnings being treated as errors
> > 
> > 
> > vim +1474 fs/dcache.c
> > 
> ...
> > 
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> 
> This is puzzling to me get_nr_dentry() is defined in line 178 in the same file and first used in line 209 
> and has been there since 2013.
> 
> Builds fine applied to tag v7.1-rc3 and to the current master with gcc and clang.

Hi

They are protected in:

#if defined(CONFIG_SYSCTL) && defined(CONFIG_PROC_FS)

With #endif on line 247.

In the rand config as least I see:
 # CONFIG_PROC_FS is not set

-Stafford

