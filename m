Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B327A1D1751
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 18:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727892818; cv=none; b=ZysKehq829s0N+43QYXsY0MIysSUMDzBXlIvMEaKfE0d5vL2khszytWtt9GiUyhIndqew2VukuuwqcBTmj/7QfqzQqWn4qN4ABcOUjb49TRg3U6S3zvL0BHi+fuIesnVEyWINS+GVXIVq09Z3Glfsy0f8DBQsn5zYrCWqgjn5Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727892818; c=relaxed/simple;
	bh=pPyGyZnHIjQkHGJR+HjvpOdK2pQI7HS2rxjykaIN3R8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ba+r8DO8wD0oGdMJVUdTJV5V440/I1T/usiCsSfqsY3/eM8tVu0H0IQv3uxlLKmFVYL7r1Inq0qNocT77yxZO+RB2GOj4ilLmsDTOsLOBdHYzUgMWZ2oMZEq63zd2Wl/H+w2O6k1Zka1+P2zPZ+5hdmeQG3RoFQb8Zmh6ilN5M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hcKKfsoO; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hcKKfsoO"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6cb2c5128d5so1181756d6.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 02 Oct 2024 11:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727892816; x=1728497616; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HAGkFFTg5EfGgoSuE7ZBlpykp33ASSRnM9qMmo+v4WQ=;
        b=hcKKfsoONmQmJ0t3lghX+LLVNqfD2wz/QuMYUA/MvUwWC+/6FFwszdQqIq2tn/9n5m
         mgxg9+FtdHYIv4+e97jEz9KLx1Hb6iqbAGC0Pep8W3f0qhUMlY4yo/OF4nA8fkVCl/LD
         gUcCvBSEbbEnHMiwnv+rvk3qk5KluAwiPfu9EPdXIBSogFrH3y/GG7NxZK0BMh/1uGnM
         4zXAz0hJFFE3m79iY3EgGYJd4t90JP4lLFpUQ07v2wpl7rleoAhSZ009IhHDxYJxavO6
         FfP34BO4S7I1q8mWtclgNZtcWWX5lZAFYyyxq1Ng10YxHBCMhgQDPyQwGg0VsUF4soVt
         f3WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727892816; x=1728497616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAGkFFTg5EfGgoSuE7ZBlpykp33ASSRnM9qMmo+v4WQ=;
        b=lAagDDPwPeYSrbGH1W7QUM16Y3TuG4Ae1qcTtZJWwpWZCxT9XgLgmGYmYijnrrUily
         NORWemN5aBoQUx+kcn2+NysZqH+/TnwIyUo3vNlEX+l/Z7ZSo6sXvAKsGbcTdqTKdFNd
         tuoMb0nHA+tMqV1wOgrc9+m9K29t2TXqG66K0eyfyf8ZdEHRMrx6NXGuYp7IvwDMZW9p
         xx5KoKdCyczBfrvOklq9TuYfMrMafOxGG6NchNg8oz0XVOVYcpGrAW+KX7bucwupvq2X
         gpYPqGHUunsgJtleuh7HK90qfA8Ucjr68TjMllMX77IBlwggfZMufS0HvOMGKkM6ph9k
         Sy1g==
X-Gm-Message-State: AOJu0YxWAv7rCftLKdoJPlq4mLdSxtwCdxMpROvrXrgNxzo4ebdb1BkY
	gyFPDJVKLLSop6IyiVLAgde04McGoysMRj02iQQjBVGfAxMqOazmBBNNyqtsHApq0Tpyy0lX1Fu
	PKWFE48aoUBQpsMYuNomM076C4qONhQ==
X-Google-Smtp-Source: AGHT+IE1XNmyIN/ZqJpQ/w+Za+3xNU+VQH2YDh/ok4cwVLPjCUr8odvRSRAJuA5J4VUWqyoKe3XF21MoS5kMSfv1EDs=
X-Received: by 2002:a05:6214:3c89:b0:6cb:50a0:1bf with SMTP id
 6a1803df08f44-6cb81a09239mr60774546d6.22.1727892815621; Wed, 02 Oct 2024
 11:13:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202410021530.DnNbPqfN-lkp@intel.com>
In-Reply-To: <202410021530.DnNbPqfN-lkp@intel.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 2 Oct 2024 11:13:24 -0700
Message-ID: <CAKEwX=Ma9usQBge8uKvin=+GsuRDgJrDYTthzLg7zhtbLMPc8w@mail.gmail.com>
Subject: Re: mm/zswap.c:744:52: error: 'struct zswap_lruvec_state' has no
 member named 'nr_disk_swapins'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Yosry Ahmed <yosryahmed@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Chengming Zhou <chengming.zhou@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 2, 2024 at 1:01=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   e32cde8d2bd7d251a8f9b434143977ddf13dcec6
> commit: e31c38e037621c445bb4393fd77e0a76e6e0899a zswap: implement a secon=
d chance algorithm for dynamic zswap shrinker
> date:   4 weeks ago
> config: x86_64-randconfig-r133-20240215 (https://download.01.org/0day-ci/=
archive/20241002/202410021530.DnNbPqfN-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20241002/202410021530.DnNbPqfN-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410021530.DnNbPqfN-lkp=
@intel.com/
>

I'm stumped...I downloaded this config file, and used the same
reproducer build commands, and it built successfully for me :(

Fellow zswappers, anyone managed to reproduce this? Or is this a false
positive...
