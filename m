Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC31A482D0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Feb 2024 05:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708405362; cv=none; b=S9EqbJU0656kYoByXOPtl5DVkqWg7QEqTdDErRY7EaFq5LuuDMe6ZxTlqzL44OiiU/xKqGHmMyW8mo2UJwy9hnYprHXWiEpTbRx041tzBiY7H60yRmsY+fT3oj1zZzomQX4URfSSYC4eO/qaX8KRvaqYdH6jq6HiWLoUYTMUTo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708405362; c=relaxed/simple;
	bh=gqL8oZRHifrqGZHF8xp6E+/yy3okuTLGI0TSHFTg2Qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=fIvEfmAyYE8aEudlq/VgLExdiliXLxRfnV2guUmHK9aX88jCe4At57XMc9FwEAf599ZHFMUkKKhUjG9gnUaf5BI/y8fVHpgH/msJugynlu2Vo1KKS4Gbim3Gk0522iYuktnbRRVjK0ivyKEiLoIufZkRSSQv19ewUQeQd7h8NPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RcuuDop9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RcuuDop9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708405359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5wjOrE2NdtYQGAgg3CY0wTj7LktEuVDWyM8Ip+zBOaY=;
	b=RcuuDop9PcHLbdNOW8YkgXh+BD0IfFNnXQTTo3px+i4RjZszHKF0cABL65yK2wBOvKBFLB
	q4Rfu9n5U8mA2fvSBlCudD6Dz5nwcd/WwqH9fWYntQYnhxuT80QwCnllPUGCYtTO/E74KK
	IX6FV3UY/tpEe77A2m5JhgperTYNWgA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-WjXl6MreMRiuWD0G0UdYgA-1; Tue, 20 Feb 2024 00:02:34 -0500
X-MC-Unique: WjXl6MreMRiuWD0G0UdYgA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A73AF101FA2C;
	Tue, 20 Feb 2024 05:02:33 +0000 (UTC)
Received: from localhost (unknown [10.72.116.2])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E7B4640C9444;
	Tue, 20 Feb 2024 05:02:32 +0000 (UTC)
Date: Tue, 20 Feb 2024 13:02:29 +0800
From: Baoquan He <bhe@redhat.com>
To: Paul Gazzillo <paul@pgazz.com>
Cc: kernel test robot <lkp@intel.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 82/320] kismet: WARNING: unmet direct
 dependencies detected for CRASH_DUMP when selected by FA_DUMP
Message-ID: <ZdQyZYQY4XR8V4in@MiWiFi-R3L-srv>
References: <202402171431.MzqHz3g2-lkp@intel.com>
 <ZdL+sSSFghXttSqR@MiWiFi-R3L-srv>
 <20240219132142.bdusrf3kcbqtv4ff@dev.opentheblackbox.net>
 <ZdNZybp3lMM1+I+V@MiWiFi-R3L-srv>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ZdNZybp3lMM1+I+V@MiWiFi-R3L-srv>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 02/19/24 at 09:38pm, Baoquan He wrote:
> On 02/19/24 at 08:21am, Paul Gazzillo wrote:
> > On 02/19/2024, Baoquan He wrote:
> > > On 02/17/24 at 02:48pm, kernel test robot wrote:
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> > > > head:   9951769060d8f5eb001acaca67c1439d2cfe1c6b
> > > > commit: a5af0b602e5ecb379fd2470669654a6abe7e97a2 [82/320] crash: clean up kdump related config items
> > > > config: powerpc-kismet-CONFIG_CRASH_DUMP-CONFIG_FA_DUMP-0-0 (https://download.01.org/0day-ci/archive/20240217/202402171431.MzqHz3g2-lkp@intel.com/config)
> > > > reproduce: (https://download.01.org/0day-ci/archive/20240217/202402171431.MzqHz3g2-lkp@intel.com/reproduce)
> > > 
> > > When I tried the step 1 of reproducer, I got failure on installing the
> > > kmax. Is there other ways I can reproduce the issue? Or have you tested
> > > the latest linux-next/master because there's some udpate about the
> > > config items change?
> > > 
> > > -------
> > >  # 1. reproduce by kismet
> > >     # install kmax per https://github.com/paulgazz/kmax/blob/master/README.md
> > >     kismet --linux-ksrc=linux --selectees CONFIG_CRASH_DUMP --selectors CONFIG_FA_DUMP -a=powerpc
> > > -------
> > > 
> > 
> > I am able to install on a fairly fresh x86 ubuntu 23.10 installation.
> > Could you let me know the platform and OS you are building on?
> 
> Thanks, I took the building on fedora 39.

Forgot saying it's on x86_64. I usually run lkp testing on x86.

