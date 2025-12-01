Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B95E25C804
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Dec 2025 21:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764623365; cv=none; b=Yxtxhx3PCR+T2FtY1JTknZQTA9EOFd+26sj2vL+qLjrlByWHq35yjGXcdlvdjLhJxlvPbNTkWSXAdB+mnhCpA4tAa+LByx4SDeRDCuXInnJczYesJ1B9WyvctK47/iUNoquM6YlFxecohX7Z4AHXeS7mUNd6Ju9ieIH8t+AiGXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764623365; c=relaxed/simple;
	bh=QEFTpiA4jdcK+obzDN8LLf+OuMZ7NPIfG5FPTQGrnF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=W8yAIVlglD7KuoS+thzp/YTR3f65Ji5XhcMS1odyFVIbLPi/51g/MCBdEVu58Gvrr87/0z329VZkRBkwkJrVP2YUPcQ1tVL78NwlJeK2qDMs/3JdP8DDVqQN7vBCa5XiFX7p6de8SIOZjyWPtWrJXJyH16CmVjx3GD15M/ydHKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WRrtFINV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WRrtFINV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764623362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8SHK0GgTMkdkR7XbF1dI3j8n6K6I3JIufMpUjg1aD5s=;
	b=WRrtFINV2L2uHwcz/6c4F4x1YMm3fCUb7RkwI6HKWN+/rSA4cxGzOugU2/Y3RuhEf7Aeah
	53A11M+9BnRkIQyaw1SQFNLJbHmFhzt+rkGP6KJRaHPtVH9wTZpdv8BN90hRdDWXN3qM3S
	jqfG0D4DCsXz5SWx/qKT0jz+Uzbqfgg=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-Rzvyi5rKNMytBApMQLVKng-1; Mon, 01 Dec 2025 16:09:21 -0500
X-MC-Unique: Rzvyi5rKNMytBApMQLVKng-1
X-Mimecast-MFC-AGG-ID: Rzvyi5rKNMytBApMQLVKng_1764623361
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b233e206ddso889882385a.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 01 Dec 2025 13:09:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764623361; x=1765228161;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8SHK0GgTMkdkR7XbF1dI3j8n6K6I3JIufMpUjg1aD5s=;
        b=iwnMBsWMXsmgI3yWiWN+2fQCSdkH59kT3kbyRsPhSOpB14EGP2ZLy4ndmCC+bZgssP
         PGADxVnTcWPHwavFnbWnDkNNhQmSRdJE+ol8xfWKA9IsyTknNpLUKFon2I8b2rTgcMzH
         jYztSmhqU30sqtWiaxeITmBt6cWoyt03m0d4mS61q2LX+RwsrAC8BENuiObh3sLgiuMC
         nbyD6dCjJInz2LNJ58DPRefbRBiFzF8756hgl6pf0yz+o9u1+GcX4cWALGENKs8A9aSc
         NFR5gU9KwARNJfgdmsijpHCeJKFUfDpBaW9DgkJGRb3/F5DHgP7bRE9iJRdtDjno6C+w
         MhLw==
X-Forwarded-Encrypted: i=1; AJvYcCWoSJ6QWssYyLzWdItHY1GvPUqen8Dnl6nZaJc6XlSdwQ2arI1P8IjmvaHQFk27WE+P+tkTJyQrJGTk8byG@lists.linux.dev
X-Gm-Message-State: AOJu0YzG7oZmUI12TrQZ1bTdq9Yfmw7B0f2Nw2xNUVDa6nNTVFl/kdvE
	eQwmPhgD54PE+0UXQaYvQAojOy8UcWRYKrGP4IAQ3/SK1vISFuqQq/UVuD6Bi16392QVa6a7Zy9
	BwSbMZfpoKlUevebgcGPTRrpX7SNbn3OICNQ6hueoCOfSTTiPdXevQA6Kc0B6WMMyT+w=
X-Gm-Gg: ASbGncvE956HVfdwS4eoxIWB0qq7VNCagql9mxhStFo/LhOQTNkS7HFr1edkDKl2L7D
	2yC+NhVa5Z0KKdy9nb8qSo3CQUoT94mMKPlD5sETYqwRLjO12InKI9oF5rnYsgsSwrxCfjD6+ft
	ZQTHPEDKwoisLxLewAcJX8j0r9u4s7uPC55uzT7zRtMHvOXl+tdf0mQjftHe5bvvqLXSJt8iBtc
	YHTMLq2+WbP1lFw4h4LzNc1cFiilrBfAMxgRL2AQgYDhA56mNqo6goEg6PGxV6bNfeCT0JfFgjj
	cCRARQrwbCtlyxLoGmBf+wqBME+WYqSW7D5zpWhSjrY6hdpIA22RCNs67Qkyd25+1IwTj2e8mMc
	FXaYOjlWu
X-Received: by 2002:a05:620a:4556:b0:89f:1204:504a with SMTP id af79cd13be357-8b33d4cfb46mr182302285a.57.1764623361050;
        Mon, 01 Dec 2025 13:09:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLBXLt5R30sfkx/LSKokz5L+c4dmVBfSQ7M5hd5ZUATTNnUb4iBmqHZoGv522WLAbsmulNcA==
X-Received: by 2002:a05:620a:4556:b0:89f:1204:504a with SMTP id af79cd13be357-8b33d4cfb46mr182293785a.57.1764623360577;
        Mon, 01 Dec 2025 13:09:20 -0800 (PST)
Received: from redhat.com ([2600:382:850e:4ee7:c142:114b:2df7:89ef])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b52a1b75a9sm923069285a.25.2025.12.01.13.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 13:09:20 -0800 (PST)
Date: Mon, 1 Dec 2025 16:09:17 -0500
From: Brian Masney <bmasney@redhat.com>
To: Conor Dooley <conor@kernel.org>
Cc: kernel test robot <lkp@intel.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev
Subject: Re: [PATCH 2/2] clk: microchip: core: allow driver to be compiled
 with COMPILE_TEST
Message-ID: <aS4D_RsvasDQQael@redhat.com>
References: <20251125-clk-microchip-fixes-v1-2-6c1f5573d1b9@redhat.com>
 <202511270924.0uDTpEE9-lkp@intel.com>
 <aS3X9VXVlKNQyDoz@redhat.com>
 <20251201-outpour-defame-49a3c68a362b@spud>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20251201-outpour-defame-49a3c68a362b@spud>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vV76EN_vUr3DB0vCV5meyOr6NSH4cvVkMV1ABGf7_bA_1764623361
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Conor and Claudiu,

On Mon, Dec 01, 2025 at 06:09:25PM +0000, Conor Dooley wrote:
> On Mon, Dec 01, 2025 at 01:01:25PM -0500, Brian Masney wrote:
> > On Thu, Nov 27, 2025 at 10:11:12AM +0800, kernel test robot wrote:
> > > Hi Brian,
> > > 
> > > kernel test robot noticed the following build errors:
> > > 
> > > [auto build test ERROR on 92fd6e84175befa1775e5c0ab682938eca27c0b2]
> > > 
> > > url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Masney/clk-microchip-core-remove-duplicate-determine_rate-on-pic32_sclk_ops/20251126-035403
> > > base:   92fd6e84175befa1775e5c0ab682938eca27c0b2
> > > patch link:    https://lore.kernel.org/r/20251125-clk-microchip-fixes-v1-2-6c1f5573d1b9%40redhat.com
> > > patch subject: [PATCH 2/2] clk: microchip: core: allow driver to be compiled with COMPILE_TEST
> > > config: loongarch-randconfig-001-20251127 (https://download.01.org/0day-ci/archive/20251127/202511270924.0uDTpEE9-lkp@intel.com/config)
> > > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511270924.0uDTpEE9-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202511270924.0uDTpEE9-lkp@intel.com/
> > > 
> > > All errors (new ones prefixed by >>):
> > > 
> > > >> drivers/clk/microchip/clk-core.c:12:10: fatal error: 'asm/traps.h' file not found
> > >       12 | #include <asm/traps.h>
> > >          |          ^~~~~~~~~~~~~
> > >    1 error generated.
> > > 
> > > Kconfig warnings: (for reference only)
> > >    WARNING: unmet direct dependencies detected for TSM
> > >    Depends on [n]: VIRT_DRIVERS [=n]
> > >    Selected by [y]:
> > >    - PCI_TSM [=y] && PCI [=y]
> > > 
> > > 
> > > vim +12 drivers/clk/microchip/clk-core.c
> > > 
> > > ce6e1188465998 Purna Chandra Mandal 2016-05-13 @12  #include <asm/traps.h>
> > > ce6e1188465998 Purna Chandra Mandal 2016-05-13  13  
> > 
> > I only build tested this on arm64. I'll post a v2.
> 
> MIPS I believe is where this is used.

So looking into this further, it looks like asm/traps.h is actually not
used by this driver, so I'll go ahead and drop that include in v2.

> Hmm, I think this is in a MAINTAINERS blind spot, Claudiu not CCed on
> it. We should probably do something about that. Can you CC him on v2?

Yes, I'll CC Claudiu. I don't see any existing entries in MAINTAINERS
where it looks like this driver would fit neatly.

Brian

