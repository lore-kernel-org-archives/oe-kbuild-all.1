Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E4B17727
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Oct 2023 13:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WbZlRbTW"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-99c3c8adb27so672198266b.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Oct 2023 06:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698674347; x=1699279147; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AF+Qe79yXub9UVn4xeznhJpuUhXUcwpDyMOziS7zLHY=;
        b=WbZlRbTW4d3diCySHPxL3lV0LfVeM7oIROwBLu67jL9QamC/B6U8i+U9gUBUpLET2a
         K8t+57cbp4udbMLZ/IHwJZ/CXMV5E3kcYvW76etEYEMSy/MVDQbdIhOKRNO4ZFAIZG2Y
         nUBJrS0n8QRCDB+xGaOTyH4bvd7VSPt7D4S6oL7fT6GmCxUNX5kze571oQus+cLUj8/z
         moeTgyO4dvVGQeyKpkQPxkkLWp8PShvRjwwpHG5V64455wKeB42AXx0V2IOxltJb/x06
         hOf+vuk3AeYLkbDMNNndywcvnV0FGjvnvyzv4i03H4Qz8kElGu3z0eZuo7yF9c7n0z+u
         DOhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698674347; x=1699279147;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AF+Qe79yXub9UVn4xeznhJpuUhXUcwpDyMOziS7zLHY=;
        b=jAyoKMACbWww45fZLeSaW/7PDQDywsGQExcl5z4+JkDxYkvTadCex8aT8YhDf1MnCs
         3AnoqQ35FDFgztRtCNR+uZqRLCpQNDFDwzFFnZuh1wxIXhS0Ztb6fRmGDmW55bME+VmL
         JaBmMLvxGl8vNI4xBT5xdyZ2PBAJf++LOobmej03lDP5A3nAJPrlwpfpwW2wpiljRDPm
         HSBYW3GWIGbIABUX3tUlNT+qm/9SCt6uTIuTWNlVlSf1KgFG6dWl+DhgVY5CEJAvqu3b
         IKGa54Ls7j+AhDmNjA+/jvgR7Q/SK4b0hL7iubdxyNO5IIaFDZvS1SZ1xHy9Akax4VPz
         43Kg==
X-Gm-Message-State: AOJu0YzRJvTNJHN3gbPw5xGws6S1B/1bF/Cj6LCZehubJo+6NXXwScjd
	X4Lhd4pwIADXOKwX+ZBsI/Y=
X-Google-Smtp-Source: AGHT+IF52rJEeWB2QkfJjXhiLxdBWtzGh7OFagouDGoCkuuCFiNumER0ehrXUXG7LnwA69TA0Iqwxw==
X-Received: by 2002:a17:906:ee8a:b0:9ba:a38:531e with SMTP id wt10-20020a170906ee8a00b009ba0a38531emr9000368ejb.52.1698674346955;
        Mon, 30 Oct 2023 06:59:06 -0700 (PDT)
Received: from krava (2001-1ae9-1c2-4c00-726e-c10f-8833-ff22.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:726e:c10f:8833:ff22])
        by smtp.gmail.com with ESMTPSA id r9-20020a1709060d4900b0099d804da2e9sm6075563ejh.225.2023.10.30.06.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 06:59:06 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 30 Oct 2023 14:59:04 +0100
To: Yafang Shao <laoar.shao@gmail.com>,
	Dave Marchevsky <davemarchevsky@fb.com>
Cc: kernel test robot <lkp@intel.com>, ast@kernel.org, daniel@iogearbox.net,
	john.fastabend@gmail.com, andrii@kernel.org, martin.lau@linux.dev,
	song@kernel.org, yonghong.song@linux.dev, kpsingh@kernel.org,
	sdf@google.com, haoluo@google.com, tj@kernel.org,
	lizefan.x@bytedance.com, hannes@cmpxchg.org, yosryahmed@google.com,
	mkoutny@suse.com, sinquersw@gmail.com, longman@redhat.com,
	oe-kbuild-all@lists.linux.dev, cgroups@vger.kernel.org,
	bpf@vger.kernel.org, oliver.sang@intel.com
Subject: Re: [PATCH v3 bpf-next 06/11] bpf: Add a new kfunc for cgroup1
 hierarchy
Message-ID: <ZT+2qCc/aXep0/Lf@krava>
References: <20231029061438.4215-7-laoar.shao@gmail.com>
 <202310301605.CGFI0aSW-lkp@intel.com>
 <CALOAHbA51eCYFsfaUVBxRrfKt=z1=77bPO1CPKEyGeph5PztOQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALOAHbA51eCYFsfaUVBxRrfKt=z1=77bPO1CPKEyGeph5PztOQ@mail.gmail.com>

On Mon, Oct 30, 2023 at 07:35:25PM +0800, Yafang Shao wrote:
> On Mon, Oct 30, 2023 at 5:01 PM kernel test robot <lkp@intel.com> wrote:
> >
> > Hi Yafang,
> >
> > kernel test robot noticed the following build warnings:
> >
> > [auto build test WARNING on bpf-next/master]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/cgroup-Remove-unnecessary-list_empty/20231029-143457
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
> > patch link:    https://lore.kernel.org/r/20231029061438.4215-7-laoar.shao%40gmail.com
> > patch subject: [PATCH v3 bpf-next 06/11] bpf: Add a new kfunc for cgroup1 hierarchy
> > config: i386-randconfig-013-20231030 (https://download.01.org/0day-ci/archive/20231030/202310301605.CGFI0aSW-lkp@intel.com/config)
> > compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231030/202310301605.CGFI0aSW-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202310301605.CGFI0aSW-lkp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> >    kernel/bpf/helpers.c:1893:19: warning: no previous declaration for 'bpf_obj_new_impl' [-Wmissing-declarations]
> 
> -Wmissing-declarations is a known issue and somebody is working on it, right?

there's this post [1] from Dave, but seems it never landed

jirka

[1] https://lore.kernel.org/bpf/20230816150634.1162838-1-void@manifault.com/
