Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBB9265629
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 12:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769085081; cv=none; b=HwM4Wf5EmtR99OqeTgeLGh5RNalnJJvNi+NcNM0TdWSlmy3w33fPv+1RJRcDi5LlNMtCEW8kssINZKo8Zju3+8R0zXRRKFw5fqFvP/PLRMFVPzLo6mbDu+FSrhD7sj2l7oynTNzrYrSMgk8T4Vb8A+3ZRHHXZwEp3aaOWVR10A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769085081; c=relaxed/simple;
	bh=nntplBT+20swkCLKitUr7M5dmp5xeZLydXiNjXxRNHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=SmSkjtthuVZ/O3Q3C1Cc6ELtVYyomjbkveCZJ05eNhu/zFePLSwLQt3o1vJ09damSYQbgQRyC/esI3iZIgjmzmzaGhxu0P2RIJ0YGOwajKy9/FkYXAJOaggwOaWlUgVTyMv44Z/XodudiWNMkivhA7Rg6MxP6uToJ9L8rhi3xBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MgY5b4my; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MgY5b4my"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769085078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LFSzJTNlbxqlWkI9uL9dnXcKklos1kYbBGtwLTdTQ1I=;
	b=MgY5b4myyRW/v52rcew/OcxPRULfgW80meLY0QdYU/x1+u7lHRiYv2CR9VU3TKPX1nTgUZ
	vy/gC3cAl+t0YmqNWaFxs/FF/xfErrEYZekBcAIN+jesHa1pUtYXkuNDF89twReT/wjUaN
	Ol6hFH0+awaRkOqKQOARsBkbIPDqZpY=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-1E-xitMXNQu3YQlQCg4YDA-1; Thu, 22 Jan 2026 07:31:17 -0500
X-MC-Unique: 1E-xitMXNQu3YQlQCg4YDA-1
X-Mimecast-MFC-AGG-ID: 1E-xitMXNQu3YQlQCg4YDA_1769085076
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89482366332so20702826d6.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 04:31:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769085076; x=1769689876;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LFSzJTNlbxqlWkI9uL9dnXcKklos1kYbBGtwLTdTQ1I=;
        b=ANU8H2BMGN7vq2Kqs/WTxYcmKiodS9BSm7YtFUJq3N2ajMWYaftxRpf4GCEK2H4caM
         UHHaFkc04nxS08mMRPkyCO9c0N0Awh7KMyXoPRI/TNe0306qwueuxjBoVk7SOdpZbT4F
         gH99j3XH7pkRAAOm6DXVS4uxjXP3WStU2Bljeox/qKeyeURKkIFDpUUfHTJxZQY/JmtU
         tuEW3l4sbQMOCxknSQrutEEVHWbu20NKrLGHaJZuUa28z8FoYf/zppar4NPSjNqHurCO
         AKX1+dP4QJBKz29lbt5R7NvrNitEGOZW0RuHxfEopk3lvH4NPt8GIaMKB5TwLWGXbiBd
         B6jw==
X-Forwarded-Encrypted: i=1; AJvYcCWpqUW8YGnDR+4XQim9iRn8n0P+3wy/AePTQ2YEJwDmuS9isu4ug7C7Swk45SL7Q9rUlSbmbIxKaqAhTTkL@lists.linux.dev
X-Gm-Message-State: AOJu0YyzFHTF61XuUNJLqnbOo2VFIs7+w+9Ha/f8BAZF/nqW6aDYNVQk
	AVWKkrKp6suBwpzQOw5zgd3Xdrudr03nw+tpO8INkq4yxkByh59mMREH99j8kw5bE+qhzqn1kbK
	W2KGrbPK20RASEzXiMnGTREu9FaKmtwAS2SJqbMKK4FHOqNGSB10pj78xp+EjCslVhX4=
X-Gm-Gg: AZuq6aLgh2Pn0W9qi8xH5AiPzIs31gFc7usC7icDiWSOCzubqaz5Tt1btALLVT5+9it
	CnsrKuVD7cqNnbl1uH/rrOnls2fJu1Bc0Gobn9JkdZWPRK2an6KlPfwt68JMYEcu3WYREOfwMk9
	8F5UlJSCANz11ZHJgpwMHQsfhxZ8UERwJImXkD3OeqpqPZqMDUGZN55UTa1+coeaNMLe/jJQ8MF
	juEk3bbhyTU2y5nC8uKIilKp7lJw9L7V+fWsRti+oaEsnuZ9rMSpZ8WXKsCOfRfUZaVEHrX1YPL
	j/I6lMKeI8EuDZSXjsV8Kj1efjnQ8lv9Zn93qQMFIixdlI46QAh3OcfXtDvzBqX8JGtCcuwubat
	8+lRGFTB80mJMVQwAJ9MZtk4fmP0C3RxGxkxVmsz5hlrk
X-Received: by 2002:a05:6214:27cc:b0:880:5867:45b4 with SMTP id 6a1803df08f44-89463837a4amr142852726d6.13.1769085076625;
        Thu, 22 Jan 2026 04:31:16 -0800 (PST)
X-Received: by 2002:a05:6214:27cc:b0:880:5867:45b4 with SMTP id 6a1803df08f44-89463837a4amr142852286d6.13.1769085076236;
        Thu, 22 Jan 2026 04:31:16 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6ad74esm143654486d6.26.2026.01.22.04.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 04:31:15 -0800 (PST)
Date: Thu, 22 Jan 2026 07:31:14 -0500
From: Brian Masney <bmasney@redhat.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 13/13] clk: microchip: core: allow driver to be compiled
 with COMPILE_TEST
Message-ID: <aXIYklgDnskI1HXe@redhat.com>
References: <20260109-mips-pic32-header-move-v1-13-99859c55783d@redhat.com>
 <202601162110.K1eWGORM-lkp@intel.com>
 <aW-_eIjcRp7VM0bt@redhat.com>
 <20260121231321.GB2625738@ax162>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260121231321.GB2625738@ax162>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: W4XAA8ooAvJzToCyc4VH2qozuCmp6D-GsKoRA-31oC4_1769085076
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 21, 2026 at 04:13:21PM -0700, Nathan Chancellor wrote:
> On Tue, Jan 20, 2026 at 12:46:32PM -0500, Brian Masney wrote:
> > None of the errors in this report appear to be due to the changes that
> > I made that allow drivers/clk/microchip/clk-core.c to be compiled on all
> > architectures instead of just MIPS.
> 
> Well, it is just the fact that this code is now compiled on all
> architectures via CONFIG_COMPILE_TEST, right? asm/traps.h is an
> architecture specific header, which might not work when used outside of
> arch/${SRCARCH}. In this case, x86's traps.h is used for arch/um but
> arch/um has never used this header before because all generic uses are
> gated on specific architectures like in this case.
> 
> Is this header needed when compile testing or could it be gated on
> CONFIG_MIPS?

I changed it so that it's gated on CONFIG_MIPS and it's working on
several arches.

Brian

