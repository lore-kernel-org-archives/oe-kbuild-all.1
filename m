Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9C420F2
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Apr 2023 08:50:00 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id eh3so114149745edb.11
        for <oe-kbuild-all@lists.linux.dev>; Mon, 03 Apr 2023 01:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680511798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F1csYuc8Du+yp6knHrKqTSIkRPNcCOVusY7pemIXMNI=;
        b=NR0lUwCqM13kiX4Ei0Wpeh4pxSI8UQQzUXYoO85m56tZ2rNpR1aa5TKAHjt6qmiHgx
         41akPXEgY+X2SDyOEJiV0xvN9/iNkHrmJxMQe+NDfGAd1Rbl7gXNMRQG2YEpWPcQobuk
         RSoM965Jaa+wOVGjbxkuKhXvExt1k2x1i/d2I5s8/8/fRFDEJFTC7M8EZ7jIZ7U5c3UG
         1mkZeaP1mnib6E9SDioYTvhE+3mEiJmGd5P3TCyInLeE5P6hK1ksukbP2VYTQ/7v8bbk
         AwZ5TlxOv+yjLUOw8GfcU1yraGmY56PT+vfAdkZdXmwM1MBRI0jPvMPWKo8pGZXUCo94
         IlPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680511798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1csYuc8Du+yp6knHrKqTSIkRPNcCOVusY7pemIXMNI=;
        b=05nT6+YIKyghzq0Okk/ea8Ad6HPIEvyhfQeHAWbkGqAxWGDE/LYCtQucaUvJVhB2dE
         rgvu0jLbRODufYyEWeK4rAcSgaoS4r4fV3fPO5ZiyQoGgvg0a2AmFsJLy5KkebTuGa09
         lpUvDTzeXFaC0MtHwHlR/dqun8RYrKlsSvOXXV6OPNSKxI7zZH1pF1kb2P7fruZztU0l
         TPirWA0tgQ6lPZyngyKTibO/9fm0XqD66bA3YptBYFcYsYfvxfBMcjVUMJbaqw9if2FX
         /51Xv4S58blQrNYSdTO+Erc3A0yuClhzP98+xvZkDfe6xZfxc1g2kRlarrywo6bDVkED
         qhBQ==
X-Gm-Message-State: AAQBX9dc/15VQOcZnHEY0kmLh1WGGqOuqshrwwFWLuSkAqudDnZfu+ec
	qPPSzA3nKnFB7U1qpV7Cyw4=
X-Google-Smtp-Source: AKy350YKFA2hrAAFD23ldjQlNISQa4Kzn5iawZXIIDNQdadr6n/MRqHG6wssuEkw6iEjd1oZcfXysA==
X-Received: by 2002:a17:906:4786:b0:946:a1c8:e000 with SMTP id cw6-20020a170906478600b00946a1c8e000mr26881504ejc.44.1680511798526;
        Mon, 03 Apr 2023 01:49:58 -0700 (PDT)
Received: from localhost (tor-exit-relay-8.anonymizing-proxy.digitalcourage.de. [185.220.102.254])
        by smtp.gmail.com with ESMTPSA id t6-20020a170906608600b0094863433fdcsm1679976ejj.51.2023.04.03.01.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 01:49:58 -0700 (PDT)
Date: Mon, 3 Apr 2023 11:49:54 +0300
From: Maxim Mikityanskiy <maxtram95@gmail.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Joe Stringer <joe@isovalent.com>,
	bpf@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	ast@kernel.org, corbet@lwn.net, martin.lau@linux.dev,
	john.fastabend@gmail.com
Subject: Re: [PATCH bpf-next v4 2/2] docs/bpf: Add LRU internals description
 and graph
Message-ID: <ZCqTMq3sHMrx2boI@mail.gmail.com>
References: <20230401200651.1022113-2-joe@isovalent.com>
 <202304022107.IwHc05cs-lkp@intel.com>
 <ZCpK5wOI0ZEedhrr@debian.me>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZCpK5wOI0ZEedhrr@debian.me>

On Mon, 03 Apr 2023 at 10:41:27 +0700, Bagas Sanjaya wrote:
> On Sun, Apr 02, 2023 at 09:47:49PM +0800, kernel test robot wrote:
> > All warnings (new ones prefixed by >>):
> > 
> > >> Warning: Orthogonal edges do not currently handle edge labels. Try using xlabels.
> > 
> 
> Hi,
> 
> I can't reproduce the warning above. My system has graphviz 2.42.2
> installed (via Debian package). What graphviz version do kernel test
> robot have?

I have the same warning on Arch Linux.

$ dot --version
dot - graphviz version 7.1.0 (0)
