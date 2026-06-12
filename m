Received: from smtp-42a8.mail.infomaniak.ch (smtp-42a8.mail.infomaniak.ch [84.16.66.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89F63FF1D8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 17:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781285718; cv=none; b=e2UqbPi6ROUfYCuQBv1D/fgSFqCE58637wMn4sbMiQhJSbF2UUHKbql7wiuIMV3Jz1V2WAMSPiHCGidEueYeyRrm0yka88JmTTFXscmWLup+IaXQ81ouI4uYNXYZnmqXsR0ju2EhHqTCGL4zejimgjgtWEnL77DMQdPdn/KKrDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781285718; c=relaxed/simple;
	bh=WxmJ8dAhtUVAVstLFuyTgPV6qBGG7gU83EedcrcZ2KM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J/1940XO0J3sAQtdsitN32hEXrVwfLfGShl8ozKQ83Is1TBFCtFPrnzuC0VUdFzFKFr1SqDrQrxKugHEAnq5Ae/hhhtL3ZIbeMIWjEIrQBHom2hAL4AP+k1M8Pv/hc0qj5PXmxqNZ5x/vwcLZvzANm3xbaz7e5k4MIOX+hKpGdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=ABr+07Nh; arc=none smtp.client-ip=84.16.66.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="ABr+07Nh"
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gcRVP1ppKzL2t;
	Fri, 12 Jun 2026 19:35:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1781285709;
	bh=oWdBhnrdbwzVv6nbhKR3nuIWPHA1TJG+Tz0/+aT/flg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ABr+07Nhi4wGjGSgLtjRLZ2iHdZMOxW2cZsIEYoCByym7TNpCVv044wCaz1W+1TYF
	 LN5jN6THT38YVcQtzPSPhkM6gAfRy5Er6NZr+1elZeOBptg4dTAN3+2psDOFOeVZfV
	 +MZ9K1ll1AhsUwu0STL+iwiXRWDz5i/2zo3T7Daw=
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4gcRVN00MvzQMK;
	Fri, 12 Jun 2026 19:35:07 +0200 (CEST)
Date: Fri, 12 Jun 2026 19:35:05 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: kernel test robot <lkp@intel.com>, 
	Matthieu Buffet <matthieu@buffet.re>, oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [mic:next 15/15] htmldocs:
 Documentation/userspace-api/landlock.rst:768: WARNING: Inline interpreted
 text or phrase reference start-string without end-string. [docutils]
Message-ID: <20260612.waicoh3ohF5e@digikod.net>
References: <202606120923.1nYYlfdb-lkp@intel.com>
 <1cc99145-0316-44f5-b134-2b4f90b326c4@infradead.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1cc99145-0316-44f5-b134-2b4f90b326c4@infradead.org>
X-Infomaniak-Routing: alpha

On Fri, Jun 12, 2026 at 08:35:57AM -0700, Randy Dunlap wrote:
> 
> 
> On 6/12/26 12:52 AM, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mic/linux.git next
> > head:   a6f0a6f5377fae42a8028f63c89d544c68f24b60
> > commit: a6f0a6f5377fae42a8028f63c89d544c68f24b60 [15/15] landlock: Add documentation for UDP support
> > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
> > docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
> > reproduce: (https://download.01.org/0day-ci/archive/20260612/202606120923.1nYYlfdb-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202606120923.1nYYlfdb-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >    Scope flags
> >    ~~~~~~~~~~~ [docutils]
> >>> Documentation/userspace-api/landlock.rst:768: WARNING: Inline interpreted text or phrase reference start-string without end-string. [docutils]
> >>> Documentation/userspace-api/landlock.rst:768: WARNING: Inline interpreted text or phrase reference start-string without end-string. [docutils]
> >    Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:40: ERROR: Unknown target name: "filesystem flags". [docutils]
> >    Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:45: ERROR: Unknown target name: "network flags". [docutils]
> >    Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:50: ERROR: Unknown target name: "scope flags". [docutils]
> >    Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
> >    Documentation/userspace-api/landlock:605: ./include/uapi/linux/landlock.h:168: ERROR: Unknown target name: "filesystem flags". [docutils]
> > 
> > 
> 
> In case it's not obvious:
> 
> > vim +768 Documentation/userspace-api/landlock.rst
> > 
> >    767	
> >  > 768	Starting with the Landlock ABI version 10, it is possible to restrict
> >    769	setting the local port of UDP sockets with the
> >    770	``LANDLOCK_ACCESS_NET_BIND_UDP`` right. This includes restricting the
> >    771	ability to trigger autobind of an ephemeral port by the kernel by e.g.
> >    772	sending a first datagram or setting the remote peer of a socket.
> >    773	The ``LANDLOCK_ACCESS_NET_CONNECT_SEND_UDP`` right controls setting the
> >    774	remote port of UDP sockets (via :manpage:`connect(2)), and sending
> 
>                                             missing ending           `

Thanks, fixed!

> 
> >    775	datagrams to an explicit remote port (ignoring any destination set on
> >    776	UDP sockets, via e.g. :manpage:`sendto(2)).
> 
>                                        same here
> 
> >    777	
> > 
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> > 
> 
> -- 
> ~Randy
> 
