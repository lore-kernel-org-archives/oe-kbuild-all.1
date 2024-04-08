Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605DB3BBD4
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Apr 2024 16:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712593943; cv=none; b=qJWRkcsxo4iRKNXRfbM1Ncl065jQEwj+gyc42fBvLVnwoAd7mL8u6D5Ai9ah5vZxVQwwQ0QeMnuZj3F4GK3sWX1x5hhEB+B//m+GRgL5Pm2ct3nG/pxd1fT/HwFOLVx3ZbGJoP1dLMYmKk5LSK/pnfVGTueCfLWnUXFG0IcYWbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712593943; c=relaxed/simple;
	bh=UO6rx4gO4Iryuuw24ES1h18tfd3OTtPpjaT1vRPDjgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=avDKjVkSkS0TVAxAzcgHUhSBhGfJBLPYmn0QRasJ3lQeZph/o46t+DifP6MMG29dH05oCwHipEzbxHcx4oyd5Rh/o4p5NCbBWWn5oGHNbKL74wKb+q+HSD1T41+QpQwBfXI0e8t33fcT+xPeZriZHQrFMO7uddL4qb/jzzUNs0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O8zvvQzf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O8zvvQzf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712593939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fiypb0jlv/DVZwSZ/5ju+659Vm+MulGx81JspNNsljA=;
	b=O8zvvQzfcv65voi1wpHOK7dR3y872G7Hdp/1gPixivnO9VoK30YhG0CznVZwnCmGzZ80Dc
	IOPFxGLyVPpxse3rAqVyxgaPAChOWtjwkDlrrPAiSQ9vF+LawJIEx1qiGL/JtYmAoFAF5u
	UwxYG7lGUxGTdGe5JvydKn5q2qu87xk=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-FMW1fR5ON1e9IvJgq3h7BQ-1; Mon, 08 Apr 2024 12:32:15 -0400
X-MC-Unique: FMW1fR5ON1e9IvJgq3h7BQ-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-78d670996e4so9816685a.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 08 Apr 2024 09:32:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712593935; x=1713198735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fiypb0jlv/DVZwSZ/5ju+659Vm+MulGx81JspNNsljA=;
        b=Zs2XsYnvNi5BNp9MT0XXJGpP+xcfH2/Uy4VE8hrEVWmK4/QFF8vc1UvG/dRkk40BXg
         9jJyZylv+B4KXGRxe3U0k3O2KNmxNA5faGAS9PyAjHzmcmJaO3eJFh+oCNhIv0etC0TL
         5Bk8lTlE++fSP/iCE+/Q1fsWItF78mjIYoGr2S/tG6fRJAm4nY4nIv9WUjmeIb47uP9t
         RjsrBjrIgMhxxf/7zHRS91vDoxEl9zD9ubGpgVi0B6GyFOhNvTM9sKZVsPlOBVswLlYn
         7juJp7xuh9vIq3YczPfu3cb8Ox+pSKRLlNcmqqm9+Yn1HgyWQPgHqO4CON1KqhNFo113
         a2GA==
X-Gm-Message-State: AOJu0YwTYLbJ85xw+UHH3qSrNKwlZ2ZhIsd/FTxc/sY8br8/g3ZrPh46
	bpfCZIPDa2VhVaWVl1lzHcT74eGRKmLZZu9sg7CWpFzOxAGPkHWVHto8ECamM/BJ+Lrz599V8M+
	8mq/VLdl9B4OekwA4GwXvu+raiFrjGaermdesFCIa0fSoK1abY9QppZXdeum6uDs=
X-Received: by 2002:a05:620a:19a9:b0:78d:6439:127d with SMTP id bm41-20020a05620a19a900b0078d6439127dmr4533794qkb.0.1712593934627;
        Mon, 08 Apr 2024 09:32:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJI77/361WHyxiI0aAs/n+LrHS+56wZAj/V1297FcIoJZj+M3Z6FExnYBR/aL227Qm+xbd+w==
X-Received: by 2002:a05:620a:19a9:b0:78d:6439:127d with SMTP id bm41-20020a05620a19a900b0078d6439127dmr4533747qkb.0.1712593934015;
        Mon, 08 Apr 2024 09:32:14 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id b3-20020a05620a088300b0078d342e3710sm3332221qka.110.2024.04.08.09.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 09:32:13 -0700 (PDT)
Date: Mon, 8 Apr 2024 12:32:11 -0400
From: Peter Xu <peterx@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [linux-next:master 3442/4242] WARNING: modpost: vmlinux: section
 mismatch in reference: (unknown)+0x1270 (section: __ex_table) -> .LASF0
 (section: .debug_str)
Message-ID: <ZhQcC9B3SDKyYWtl@x1n>
References: <202404081248.FE1RbA1V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202404081248.FE1RbA1V-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Apr 08, 2024 at 12:53:19PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   8568bb2ccc278f344e6ac44af6ed010a90aa88dc
> commit: e79da3a55e4e7b60b2790b3402a1a6c19829e9ce [3442/4242] mm/gup: merge pXd huge mapping checks
> config: riscv-buildonly-randconfig-r001-20230517 (https://download.01.org/0day-ci/archive/20240408/202404081248.FE1RbA1V-lkp@intel.com/config)
> compiler: riscv32-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240408/202404081248.FE1RbA1V-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202404081248.FE1RbA1V-lkp@intel.com/

[...]

> ERROR: modpost: __ex_table+0x1258 references non-executable section '.rodata.str1.4'
> WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1260 (section: __ex_table) -> .LASF3592 (section: .debug_str)
> ERROR: modpost: __ex_table+0x1260 references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1264 (section: __ex_table) -> .LC59 (section: .rodata.str1.4)
> ERROR: modpost: __ex_table+0x1264 references non-executable section '.rodata.str1.4'
> WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x126c (section: __ex_table) -> .Ldebug_ranges0 (section: .debug_ranges)
> ERROR: modpost: __ex_table+0x126c references non-executable section '.debug_ranges'
> >> WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1270 (section: __ex_table) -> .LASF0 (section: .debug_str)
> ERROR: modpost: __ex_table+0x1270 references non-executable section '.debug_str'
> >> WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1278 (section: __ex_table) -> .LASF2 (section: .debug_str)
> ERROR: modpost: __ex_table+0x1278 references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x127c (section: __ex_table) -> .LASF0 (section: .debug_str)
> ERROR: modpost: __ex_table+0x127c references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1284 (section: __ex_table) -> .LASF6 (section: .debug_str)
> ERROR: modpost: __ex_table+0x1284 references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1288 (section: __ex_table) -> .LASF7 (section: .debug_str)

[...]

Hmm, this doesn't look like relevant to the small commit e79da3a55e4e7b..
I'd guess this is an irrelevant error with the randconfig which lacks some
sheer luck.  I'll ignore this one as of now, but anyone can correct me
otherwise..

-- 
Peter Xu

