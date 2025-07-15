Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E6E2BE64E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Jul 2025 20:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752613201; cv=none; b=WT6xGbw5cPUXOuWLVo/BFFWHE6MXwwQnMVSoWB30Wj75H0GWmDQ/Fo7BBWJPgoXa4LeXyoGTNcboub/PwSTyoZDOTwUKC+sopUwk87GcY5OoXHV9Y6dTn0x+3VxtHw3TWbVofTT8KsOh5RAYgS8JNNNeqFrg2UWGFfW0CsqUj/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752613201; c=relaxed/simple;
	bh=t5UHwHUcwuFO2mxJ1wCOTzEma5fPdwygV6zuENXmDPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gNSzmEtjFmIaCG2wjUeNa/Ah6YYHHVRikEGhCtsg/qO7SjEc+fAwh4KZ9T8zeYH7etWBftEb5cIV0/kRO3qBjp/47kwQCmpLfzcpGQzZRM3mZTwxtu5GybU4OXJb3XkOdrNQWME/zbQfbRTV8XOAr6lTrkC9kXeRPJE8vI+HTAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=H77IPP9N; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="H77IPP9N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=qAIO
	8P8iEkJ6QxHboa4hnNaoyWAS2UElUdw0iVqs3uU=; b=H77IPP9NX4ItN0pgE9An
	DYac39OI3b0l96I9TJlz5RDURbGnQDl8PZ4TbcEW9jkiuMUSJhfDI5/aHwui6qWH
	E3xkhGQyTufQHDFSl+N7cH0THvcfjIkVZ2j2z4HmYZqdpR2WDgnA4XQQY5HdmHKS
	5izdjXcRrePFPNkF3dFlG0Sg1Nrpjs2MbPRiMRpDdFCMoM2/WUeFlaP7m638z4SK
	UVfo2kyOrH0BiQhNIokJ7QiCPQ5mc32qup1JE5iF+cBZwL4NCXR6a7orm5UMKbho
	dHAv1BmJ/x2hXXTAR3bU0MPv27ocy1kzN3g2p26M1wFQLbIiTE1JVsXEhwF8LXp8
	Yg==
Received: (qmail 3044531 invoked from network); 15 Jul 2025 22:59:57 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Jul 2025 22:59:57 +0200
X-UD-Smtp-Session: l3s3148p1@ex4OD/45wo0ujnsR
Date: Tue, 15 Jul 2025 22:59:57 +0200
From: Wolfram Sang <wsa-dev@sang-engineering.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [wsa:renesas/g3s/i3c 7/19] drivers/i3c/internals.h:35:9: error:
 implicit declaration of function 'writesl'
Message-ID: <aHbBTY5gJ15B-x98@shikoro>
References: <202507150208.BZDzzJ5E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202507150208.BZDzzJ5E-lkp@intel.com>


> config: x86_64-buildonly-randconfig-003-20250714 (https://download.01.org/0day-ci/archive/20250715/202507150208.BZDzzJ5E-lkp@intel.com/config)

I can't reproduce this with the above config.

> compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250715/202507150208.BZDzzJ5E-lkp@intel.com/reproduce)

> >> drivers/i3c/internals.h:40:17: error: implicit declaration of function 'writel' [-Werror=implicit-function-declaration]
>       40 |                 writel(tmp, addr);
>          |                 ^~~~~~

But I added the 'linux/io.h' header to internals.h and will let the bot
recheck my branch...

