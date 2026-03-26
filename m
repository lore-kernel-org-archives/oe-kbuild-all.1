Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7475A32AAA0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Mar 2026 19:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774553925; cv=pass; b=ZB9yBstwM4TW+ivqe/RwtCVtc9OjP0itgun/aKyMTs5mOimyi7Ksw4MKbq3nc6kdTndTz0l1YzM0HydBhhNA+B6XOmjKYn8RsMowTzCoCivMf1YFG3cgF+SivnSbCqE9q6N3cQLbTNXorpMIn7MrG24kE+BBH1DegsrrvRREDgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774553925; c=relaxed/simple;
	bh=Db4TAAnVc2T0Rf7Wc2cEY/pwtSDY+KMo+MImooH/kK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H6dBU+Z4Zr+EfnVn9pGrSw1aID0NKG/UCCmhPMuhuKu8WuNJCzHPFRXa5K1ilbSY4BIXdUi/zjxjcKaqpb3vl+cL8w/kf8BBpvm6QyWKmYAaFqG7FFzPjoEleve9NFtPdOAUK++8Lx98cuodL4bUzHvdl/wT3XWdSijw5Of30WM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fWpJeIUW; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fWpJeIUW"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1273349c56bso1761941c88.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Mar 2026 12:38:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774553923; cv=none;
        d=google.com; s=arc-20240605;
        b=gGP71eEBSwhQ872+EJToRqawetpoXws15Sf8dkCOqX6/GP/GaLvfT38/tGPnYU1cxF
         8km1FWTXN832X4/D0cVDzpKMFQ38GPeE7UOyMxs/gy0aIg9sVaHON9tT/VQXjzFzHWDV
         DPwidw8lPOICBpkCkiXQ5hCb+SmCVBye+5MNSafBN/6AGQ6eWiw5i1J2ClI1JTDJKNgQ
         NBYrauXxuBxsVCvAX+S9b9zv/MOn+chbnVGeYVXd/aojwkUUH+45+imNA70SyexiXgy4
         GH6F/S9jF/baXxkd3Hlt9RatEvAyvraeJGt/+C52iGj+vNCa6tEAWBGziDKKdK0Ze1Kz
         nr8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6mCMJ7IYsFJz0Hh2fdQYOLxKjKcxltIu2zRqwDNj3FY=;
        fh=S/FdSn/Z9nFhWHNyAoT374vBnusGGltfOZzwdsuEIwA=;
        b=aHCq6Bs8ZSW5RgxkmKdouB1EgCXy5f9EgNaCphKW8ekEv6b5Fuw/bVlOtpGCtqcJAQ
         8/NHww2dx3K2USJmizsH8ueEUW1l7POvO1hUPSSpfaHc9jiOAVYd02cby9Mp1UZeoKxX
         +iY4C9mawBlnkz+z6fG+uGGORq3FfgW4EYIkQFiVPqCdgdQDXhfqUIL17WsH2hspJ+lA
         OgsDw3mGLf1EaNRjhNh4jLeRXM958EEzKU/hH8oQ/Dl3yWawFYJ/lRkHlskZzKO4iIA1
         VTm2e7pdxzkIVr8UEYp3dj81kA4Y0f27lopneKvRLoMxbYyAU/AwGwpf2ZJvME/TcObr
         GaXQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774553923; x=1775158723; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6mCMJ7IYsFJz0Hh2fdQYOLxKjKcxltIu2zRqwDNj3FY=;
        b=fWpJeIUWBEK5XRwul6JQeA855tMPkdM5NQ2ffzgDGhDObRJOfBY4mGuWcF+AtgmzWi
         Ak+oPEQCSEcaszu0Hy17OhlwstZGW6epweermhyYeUYymlwp5UXNtli0YEwE2D97QNKw
         P6+ObDQRVshjlgrA8QPqBOIu82iXtE1VePyiRppxnhZpmnPAxyeoJafyRrYq5w/tyGnp
         qMeGUwZHX7e3/4n+dj6bIttrooFHb3BOWdLrDeT0+m1gtRb3JFlbvdIGPMaaPJ0SEjsV
         7p2vmbWavwuxykTPGpL2L22bJfJ9wEVok3zHsuWxkErFtb6U0TBPca8pfQGINkKcixII
         DIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774553923; x=1775158723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6mCMJ7IYsFJz0Hh2fdQYOLxKjKcxltIu2zRqwDNj3FY=;
        b=PyP4sB57dpRUtr+FL0SlJnoeMN2vukcermq01yYDm8fP2JXZch2kEDY3jkKml7GfNk
         verEgln9wLg4q9fuBvmlK3XZDhg29Exuwx+JR3FAYuMZz3ohcKS41PRSgRRdn47YCMeU
         sxmZfE7fmG34PI5P4oyuRrzq1loSffnfFEwojPN+aJz2IeSMPzg2zcUNIVpvhO1L/CCE
         YCOcYh/5oX6pNdZh3HApt9gnumUZ110lKY+ohBS6OVqmOnCUoKvcp3BhoN9yfC/leP2e
         50RYcQ7HbXYGnQvx5vt+p5UMKg2mUZ4jtL8UU/Kj2C/wQEkJmp3WdOioMYxJcBq3Xt3Q
         EGPw==
X-Forwarded-Encrypted: i=1; AJvYcCUIorkO8nM62DJ/c/qajaJsR94wsqlPidrYN1KdA+JNZnI44aCkPqoJUgz2zb4XKIA9GzOJoOJkwsaVSC8b@lists.linux.dev
X-Gm-Message-State: AOJu0YzaTmXARSas5KgNvEHg3L+H3qcbw5uGjh64l8Q+D+SxWnFdHr97
	ncuh0UWtFFPxtkwJGc4R094MMwymAo1B2OXBJjbDG+UwCYfuQiVX7IreU7CR2uOVxq8h32+lYaG
	TwGODKSeW7mGdEtA4fHhKSDWM+4avi9p/EeN++MDi
X-Gm-Gg: ATEYQzyw052lmhSBeZDH9PBVvLKTlyCRcNVCsd61bXQB7x0LG0UZeA9QdRkXqt/BYc0
	A+xKqW03pU1jXc3Yvvbh31UlLH2vZD6VnQPZ68gIjcsrPNOfZsWvYSteSqqhKl8C94lZRFRPkPV
	SSmLlRUnbAePTu0zNKaPQzf0XJ/uinftzTEeNzkGEOzizO0c2p0qxGY9S6pDg82OiFvWCcVrTmo
	vLTH/PD2GuCuPHEb+q2IxiHZ79RWVVw/8g7xBruCbFJUOe2SWU5Z0HIe/7WJd4rW9jh1APjXb+X
	jmsAxn7n3ZiOpVJpMYIk4bGBytLXLzwO4lo4+RHsr0f08bK/MnAzqUkf4wYYP20HL70bQg==
X-Received: by 2002:a05:7022:ff45:b0:128:d51a:5157 with SMTP id
 a92af1059eb24-12a96f09443mr4300359c88.33.1774553923052; Thu, 26 Mar 2026
 12:38:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260325063843.1790782-6-kuniyu@google.com> <202603270301.kJulQgkT-lkp@intel.com>
In-Reply-To: <202603270301.kJulQgkT-lkp@intel.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Thu, 26 Mar 2026 12:38:31 -0700
X-Gm-Features: AQROBzC56kOOvilMQ9x7JfCrqjezesmORZsrlXxqw-kdyJdYRmxiltxnB1IbvvY
Message-ID: <CAAVpQUBdco4wFmdVFdi4yQbH38fDCNLL-SUD=udBUy8uJ0spqQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] nbd: Use lock_sock_try() for TCP sendmsg() and shutdown().
To: kernel test robot <lkp@intel.com>
Cc: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Simon Horman <horms@kernel.org>, 
	linux-block@vger.kernel.org, nbd@other.debian.org, netdev@vger.kernel.org, 
	syzbot+7b4f368d3955d2c9950e@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 12:14=E2=80=AFPM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi Kuniyuki,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on axboe/for-next]
> [also build test ERROR on linus/master v7.0-rc5]
> [cannot apply to next-20260325]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Kuniyuki-Iwashima/=
nbd-Remove-redundant-sock-ops-shutdown-check-in-nbd_get_socket/20260325-175=
457
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git f=
or-next
> patch link:    https://lore.kernel.org/r/20260325063843.1790782-6-kuniyu%=
40google.com
> patch subject: [PATCH 5/5] nbd: Use lock_sock_try() for TCP sendmsg() and=
 shutdown().
> config: x86_64-buildonly-randconfig-004-20260326 (https://download.01.org=
/0day-ci/archive/20260327/202603270301.kJulQgkT-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260327/202603270301.kJulQgkT-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603270301.kJulQgkT-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> ld.lld: error: undefined symbol: inet_shutdown_locked
>    >>> referenced by nbd.c
>    >>>               drivers/block/nbd.o:(nbd_mark_nsock_dead) in archive=
 vmlinux.a
> --
> >> ld.lld: error: undefined symbol: tcp_sendmsg_locked
>    >>> referenced by nbd.c
>    >>>               drivers/block/nbd.o:(__sock_xmit) in archive vmlinux=
.a

ah, CONFIG_INET=3Dn.  Will fix it in v2.

Thanks
