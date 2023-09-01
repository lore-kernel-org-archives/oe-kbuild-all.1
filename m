Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B916A943
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 11:18:49 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-522bd411679so2447199a12.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 01 Sep 2023 04:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693567127; x=1694171927; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OKUKkscMbo2sHkOR54IFbAf9unUVXEKFng+dXrwZ0uc=;
        b=fOd2cZDTnfoi7xzNLLNQ/sZt+mUpEuNS+Fzfq7aL2pK6DZ1UkcAYjdwtuD0But0qaD
         1Cj9Gndv46WGmqp7m6WeYa+NSgsryGfIzM/vKqOzNA1+Cl2zdVHUo6LP80UWW384oR96
         KgQTQI1Tf1NxmmKa9ijE6rrXb9q3SBM6TQpSYewmR57/RdHQ64wxzb4MNNa1Ianh+czl
         xKsKhUgjmLu6YnlcT221Wq0HgGirGNAJs6F/iz1LsPfHCjkwXFpWVfms/m9gDYjrE34t
         RwbRBXr3YTRERsgGFg7Do8nWkx3GYaTpupyrzdMswRT8ey+xRBVuySJp8n8QuhK2UW06
         X0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693567127; x=1694171927;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OKUKkscMbo2sHkOR54IFbAf9unUVXEKFng+dXrwZ0uc=;
        b=iFY8Agb7KFmVNTiGfa0Lzc036ABowiPW0ApAWvJPy7t23BfF/47hseCZtNsed0UoNL
         yHSdgD3H2a4yy+1rBK6Pqs+t9r+OBEm6m9w0dthxnD/skXTiK0l69HfbfRByKhuJDiKk
         GsLR6/5VxuNZBwRyJx+SYZR01l4LRxihLKVigjQHs3pRJwdWD3b3Of9obj8LAY7D9yQ4
         CmgdoNlG5LSmtVSGEvzxiMZy6aBWrQutEfYnLLgAUYLG7AgT+e27QglocIWhHG3XkN2x
         wGFmzo+oXku5bJ/SXtIzl7ubxLdwL1FxhYHeYW1/7vqL1sYssfE9wJ5a3y5hZ+Y1lOip
         WTTw==
X-Gm-Message-State: AOJu0YzW7GtgvRkI0ICdFMPdyTGqcRgWX8I8x6Ey+I0Glpa7LV9z8538
	RQnh57H9yH/LNJR79uFWiv4=
X-Google-Smtp-Source: AGHT+IG+Zbe9r5mysEIrYUr3UOXcmH2XzJhLI9upk37KkQ9CZqt8ivRVPRxY96SxINk75tUMyLGPLA==
X-Received: by 2002:a50:fb17:0:b0:522:2ce0:d80a with SMTP id d23-20020a50fb17000000b005222ce0d80amr1627609edq.35.1693567127342;
        Fri, 01 Sep 2023 04:18:47 -0700 (PDT)
Received: from [192.168.1.95] (host-176-36-0-241.b024.la.net.ua. [176.36.0.241])
        by smtp.gmail.com with ESMTPSA id w13-20020aa7dccd000000b005256e0797acsm1951524edu.37.2023.09.01.04.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 04:18:46 -0700 (PDT)
Message-ID: <5009129a873cf20adacd679d5073c799f79672d2.camel@gmail.com>
Subject: Re: [bpf:master 6/15] htmldocs: Warning: Documentation/bpf/btf.rst
 references a file that doesn't exist: Documentation/bpf/llvm_reloc
From: Eduard Zingerman <eddyz87@gmail.com>
To: Daniel Borkmann <daniel@iogearbox.net>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Date: Fri, 01 Sep 2023 14:18:45 +0300
In-Reply-To: <a62b47218f1852d09b243b8fb1741c2baca4d336.camel@gmail.com>
References: <202309010804.G3MpXo59-lkp@intel.com>
	 <6a92003b-e47f-01bc-57d2-d2fb30292ad0@iogearbox.net>
	 <a62b47218f1852d09b243b8fb1741c2baca4d336.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2023-09-01 at 12:26 +0300, Eduard Zingerman wrote:
> On Fri, 2023-09-01 at 08:29 +0200, Daniel Borkmann wrote:
> > Hi Eduard,
> >=20
> > On 9/1/23 2:05 AM, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git m=
aster
> > > head:   be8e754cbfac698d6304bb8382c8d18ac74424d3
> > > commit: be4033d36070e44fba766a21ef2d0c24fa04c377 [6/15] docs/bpf: Add=
 description for CO-RE relocations
> > > reproduce: (https://download.01.org/0day-ci/archive/20230901/20230901=
0804.G3MpXo59-lkp@intel.com/reproduce)
> > >=20
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > Closes: https://lore.kernel.org/oe-kbuild-all/202309010804.G3MpXo59=
-lkp@intel.com/
> > >=20
> > > All warnings (new ones prefixed by >>):
> > >=20
> > > > > Warning: Documentation/bpf/btf.rst references a file that doesn't=
 exist: Documentation/bpf/llvm_reloc
> > > > > Warning: Documentation/bpf/llvm_reloc.rst references a file that =
doesn't exist: Documentation/bpf/btf
> >=20
> > Could you send a follow-up fix for bpf tree?
>=20
> Hi Daniel,
>=20
> Will send the fix shortly. Strangely, I did check this syntax locally
> before sending the original patch, and had no warnings reported.

I followed reproducing instructions but can't trigger this warning,
tried several sphinx versions:
- 1.7.9
- 2.4.4
- 4.3.2

I'll remove 'Documentation/bpf/llvm_reloc' and 'Documentation/bpf/btf'
labels from the documents (and these are link labels, not actual
links), but it looks like I don't have a way to check the results in a
way compatible with test robot.
