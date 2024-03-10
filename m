Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954073A1DC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Mar 2024 23:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710113304; cv=none; b=IpCvNyfdTI2n/izZ8SVlh6mHQ+i9itOVohHC7FyX0WP3DgEYwASS+OYcXX7OPCFYpnuDa9mkCtoNqDVQzQT017dUI5S+GfnkUAFCr0DK/0hYaOkrAeWZsWEr1AGMfTC5cUCg4ztOzFOwIXw9KVa22TnxTFsQYPS43/Gf2Be/X/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710113304; c=relaxed/simple;
	bh=SGuyNlQMy7cpgEOzEYOZ9/m2PWB7CMQmPRk5teokNlg=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fAHwiFV+ci/eA3NgbaA/lbEJcHBAfXEsm4JxJeGW6eSQxJzWocw4oACUHz8Nmf+AxgSBHfBLkimoUL+3mxkhClhMgT1g6bjlz5IQkldjjxHl+IOOF5kf9Npi3g6YAlEFfw+QGd5TOTBVlpmLFp7L2VOe+JT1CorWnbyGFubJwqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BSCwtb9e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BSCwtb9e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB8CDC433F1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Mar 2024 23:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710113303;
	bh=SGuyNlQMy7cpgEOzEYOZ9/m2PWB7CMQmPRk5teokNlg=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
	b=BSCwtb9eVyMGuCJKQRzzUivyAJo7tHYKDfv4qwq/I3bXoWJn9U46cWEV9cMgEXPoM
	 JizA/jzcay0znHd2e1P9kQaCwHqrB7I2miMT7EHr9SWzgW7wsHIadG57Ofw+6EaQw5
	 MELJO/nV03Qaq8SQ5EqY2NEqnpRQ4tKKFexGhiTMPNRsfirFDj5gbDtWbwPUUl5JwM
	 eK94QqXwlV8579j1JgJ4CWoPDDWXPg3tW5jyNaY6h7mVfntZjm0I8XRrDkNw8NK97V
	 Qs28z/VRDhFtJYRIaR8GMyYSd1OSdiR+1G6fity0IwQuCU/xA8xm02jk/vXmYcMrTU
	 GX1ABYHesUtYg==
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5a1be5dbc52so1412219eaf.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Mar 2024 16:28:23 -0700 (PDT)
X-Gm-Message-State: AOJu0YxWDitqOqhKoNI8TG9lLBpwawTtloluSZvJYoFs3eYnFv832m72
	gg273Z0SJA4P2fjSsFNCiLeC73fEAxaO0LVKlPVuMtY758KZcD0Zceyc2PG1L6R8JLVb/4K6GGB
	LKQdf+nAE37aGoKHFyHrul06w0vM=
X-Google-Smtp-Source: AGHT+IF8DEaew73X+lHOVDziOj85sesgfwxXdcXvjhAxzNKMC/5A6mSx8j+aih3xP69AaQc0uQb4+OJhO0e2N5cMKQM=
X-Received: by 2002:a05:6870:b697:b0:220:8d07:cfa with SMTP id
 cy23-20020a056870b69700b002208d070cfamr2762190oab.8.1710113303130; Sun, 10
 Mar 2024 16:28:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:ac9:7bd4:0:b0:51e:5fb5:2f75 with HTTP; Sun, 10 Mar 2024
 16:28:22 -0700 (PDT)
In-Reply-To: <202403110144.cDrtOmgD-lkp@intel.com>
References: <202403110144.cDrtOmgD-lkp@intel.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 11 Mar 2024 08:28:22 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-CnqatGKaMsUr13_S0XdpFFxEjDYgjS-Mk29sncEBJLg@mail.gmail.com>
Message-ID: <CAKYAXd-CnqatGKaMsUr13_S0XdpFFxEjDYgjS-Mk29sncEBJLg@mail.gmail.com>
Subject: Re: [samba-ksmbd:ksmbd-for-next-next 4/4] fs/smb/server/oplock.c:1508:
 warning: Excess function parameter 'is_dir' description in 'parse_lease_state'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

2024-03-11 2:23 GMT+09:00, kernel test robot <lkp@intel.com>:
> tree:   git://git.samba.org/ksmbd.git ksmbd-for-next-next
> head:   f4ab0ca366e96a297b511d020a7fcd212f0268c9
> commit: 74b8c7501e13353ad71b93aaf88aae65381593bc [4/4] ksmbd: add support
> for durable handles v1/v2
> config: alpha-allyesconfig
> (https://download.01.org/0day-ci/archive/20240311/202403110144.cDrtOmgD-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build):
> (https://download.01.org/0day-ci/archive/20240311/202403110144.cDrtOmgD-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version
> of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
> https://lore.kernel.org/oe-kbuild-all/202403110144.cDrtOmgD-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>>> fs/smb/server/oplock.c:1508: warning: Excess function parameter 'is_dir'
>>> description in 'parse_lease_state'
 I have fixed it.
Thanks for your report!
