Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E704A9D66
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 23:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790811670; cv=none; b=rYMTq0jn7T0Gi3aRs0aSI76qr7GVFtaNGI3jQuTDsNBFZ/JT0plwm7wXncGgbAhhkvBSl4RDJV76eA5VNLPIFc+K1YzmJn0eH/S4YT235OsstDFAZ39MKgFqQ5gkRcYmP9dVji43t3j/cWDp3MPlIJjRoZ2H/BQlu7VSMk238/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790811670; c=relaxed/simple;
	bh=3k0Zf9I7WIpUcUmHGwFy14VrJWteGborjJKrNtbtpw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=LqiMwCe9zNis7Z24p+7F6t6RySWpfEuTc6YbzW4JZtPddci+73cOeHCvlzdcxaKt6fYjoi5d/yRIA/DFw5LcidCK12O2YgrBcZcygpPKzOQVg7TC/RkEwyRKZWu9nHsJrIw6gPpu9o/uPlWhdYhU7Xli+34YD5wQ0lk0KtYMEbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iS6zYUhW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iS6zYUhW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790811667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dxD3qjh8bcMrF3krjbsimwiCkX7NTaM6faCoDJ4Dbvw=;
	b=iS6zYUhWZJUVJfYCKePS2+durSXgphyESG0lMRClo1Tez2b/ywZhd3bFEGqOxx2HJECGLY
	tS3fB+obhhu/5UaoayuhOZQFgZD1gh73OvQua9OZeHxXf1IIUHqG9E/Vy9/3ROt8l21c9j
	h8EKyYqnoEwLp/TP+AB+AEtZF/lHbFU=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-JYw2fCZTPSeCMBHGggbLjA-1; Wed, 30 Sep 2026 19:41:06 -0400
X-MC-Unique: JYw2fCZTPSeCMBHGggbLjA-1
X-Mimecast-MFC-AGG-ID: JYw2fCZTPSeCMBHGggbLjA_1790811665
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5337f26ee19so22099041cf.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 16:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790811665; x=1791416465;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dxD3qjh8bcMrF3krjbsimwiCkX7NTaM6faCoDJ4Dbvw=;
        b=Xlzo9jU52UYIiriqzueUKXPxfksU1M+bhu2H4tKkvyJKIhsMBsW4qmbWUlmmWaOsTA
         QGw1KUYcvb3D2LhRE+Pbnbae8nsnJfCvtrZKWISSxxMtpHg8FI8v0hDvYVXb4EdHjTru
         IMxHhBLf9zDFwtIj005fq0lIoSvMf3MXUsCJZm5UqK4jWZV0HOAc8ZLmJC+5TLS/kc3N
         jPm2fSgxdkeROxeya0S28f25hAnUG2robUXGSvbaDnfcGGE6ogT+ZJZQcl3VFbRVxskI
         shq6CoiDMTO46pw33ATxgmEjZJ9rEfdcNLvl+5+YWFwOQx0f7eqLdtxqrNdsggl8Xrkb
         q4Sg==
X-Gm-Message-State: AFuF++nzAr1+z63LxxYoy66MxeJQBnQH6EN+gNIUN9NWH0z+5E3udXyp
	VDmnbAveb2KzpRFSjs/DO/MS0lXlbyuJF9CAcNpRX5uSuxoXqS6a4OveUejqYJoMy0iPKaSXRg3
	GhQ9LNbm7WH4odMMjQGKzuq+z3qSrwGY5QXBzkN1IcNN5wtrslNFUi2kISmpxpXwzUt4=
X-Gm-Gg: AYBFou3rz0mmbAvHvnbTFnjAXHAHAtwygNLOeFlufl0dfF9CTkOXPK4eHhP6ET57Z9Y
	itnxs+QMgf8Vkx3PDXeeujdQKWxNHKu+ph2OuL4OYXxTZ//dXTXdylaPzI7AesR2DCMOv8rQzWv
	Cem+WZ5P/DclaGdeDJBrfo3XjsoX7Dm5176z/zJgDQ6QZsOluRV9dMyoWRQ8Jwnt0cOKMg6m24w
	o0Aly944eTwSvS6zOyY300LZyXsEM03sxDY0rfxXTOLoErP8SebR67F7wqsd9sVY+K6edAszVdt
	a1LiuQ3DfarwpBcT4H5/CvTfQLCERUXLXI+VHLw+A5WP6pfdt4NI+2J2njgevbscyQxu5Gzbzs2
	ojPT4LsmI4z4Ix1wL2HDWGRsc2wTY0aD/4uQ=
X-Received: by 2002:a05:622a:5810:b0:530:f7aa:d424 with SMTP id d75a77b69052e-5337427d2afmr62138231cf.20.1790811665547;
        Wed, 30 Sep 2026 16:41:05 -0700 (PDT)
X-Received: by 2002:a05:622a:5810:b0:530:f7aa:d424 with SMTP id d75a77b69052e-5337427d2afmr62137831cf.20.1790811665081;
        Wed, 30 Sep 2026 16:41:05 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5338610ea32sm5532801cf.9.2026.09.30.16.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 16:41:04 -0700 (PDT)
Date: Wed, 30 Sep 2026 19:41:03 -0400
From: Brian Masney <bmasney@redhat.com>
To: kernel test robot <lkp@intel.com>, Rosen Penev <rosenp@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Subject: Re: [linux-next:master 11187/12559] include/linux/stddef.h:8:14:
 error: called object is not a function or function pointer
Message-ID: <ar2eD2s6pDLd73DR@redhat.com>
References: <202610010151.2W0MrmxE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202610010151.2W0MrmxE-lkp@intel.com>
User-Agent: Mutt/2.4.2 (2026-08-30)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dscHVMd7zyy0C-cYvmh2uJ3sGcTZM-IXtGWzyvUlqSU_1790811665
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rosen,

On Thu, Oct 01, 2026 at 01:18:36AM +0200, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   6c2cb8b8b843d216ab549b678a0d8831c43153e0
> commit: d0b72c88671b3c46342bbebc9b90280890436c98 [11187/12559] clk: mmp: allow COMPILE_TEST builds
> config: m68k-randconfig-r2308-20260930 (https://download.01.org/0day-ci/archive/20261001/202610010151.2W0MrmxE-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 8.5.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261001/202610010151.2W0MrmxE-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610010151.2W0MrmxE-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/uapi/linux/posix_types.h:5,
>                     from include/uapi/linux/types.h:14,
>                     from include/linux/types.h:5,
>                     from include/linux/of.h:14,
>                     from include/linux/clk-provider.h:10,
>                     from drivers/clk/mmp/clk-audio.c:8:
>    drivers/clk/mmp/clk-audio.c: In function 'mmp2_audio_clk_suspend':
> >> include/linux/stddef.h:8:14: error: called object is not a function or function pointer
>     #define NULL ((void *)0)
>                  ^
>    include/linux/pm_clock.h:77:24: note: in expansion of macro 'NULL'
>     #define pm_clk_suspend NULL
>                            ^~~~
>    drivers/clk/mmp/clk-audio.c:405:2: note: in expansion of macro 'pm_clk_suspend'
>      pm_clk_suspend(dev);
>      ^~~~~~~~~~~~~~
>    drivers/clk/mmp/clk-audio.c: In function 'mmp2_audio_clk_resume':
> >> include/linux/stddef.h:8:14: error: called object is not a function or function pointer
>     #define NULL ((void *)0)
>                  ^
>    include/linux/pm_clock.h:78:23: note: in expansion of macro 'NULL'
>     #define pm_clk_resume NULL
>                           ^~~~
>    drivers/clk/mmp/clk-audio.c:414:2: note: in expansion of macro 'pm_clk_resume'
>      pm_clk_resume(dev);
>      ^~~~~~~~~~~~~

This isn't directly a bug with your patch, however it is newly
introduced now that the driver can be compiled with COMPILE_TEST. Would
you have time to fix this up as well?

Brian

