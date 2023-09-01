Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540F42CA6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 11:48:30 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9a5e37a39ecso211792566b.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 01 Sep 2023 04:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693568908; x=1694173708; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TRUiPNGKIo1/hmGSajXli1xVGkOsvodmD7ypYhalUQY=;
        b=iKsRC0D3ZdaMEkXr0EUI3UTXJsNNS5P9UrM0sl/akMt7PPpjl4mFfEz7hOp6RxRD5U
         NUxeZpIYNLFoV5AWaVhK7c9B5fVKGtCEEv9frisIG7zokLPZ2ohIB+Z7tqp91IbWG4Ei
         ccHuQa0j1ReeJEWHeV9m+JQ1ZfVUL6oIfqplUQPM7806LzIMrRPMrUoCn+KEUwLt5E7E
         QQ77QxAjC/82t91gLwXWHgFwMu03giO+9Q2GyAXE+SXY3vR4fc5Xl6RqkFByjTVqe/H8
         LIwWYP9HcozSmpLFRPwOtY/qF0op59Q9nOEE7yWst2uu0X2GBRT8JfPKwnZNsFpNNi6Y
         3bWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693568908; x=1694173708;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TRUiPNGKIo1/hmGSajXli1xVGkOsvodmD7ypYhalUQY=;
        b=i3dKapMiD7lRg5JHWL/96wcvneohWW6415aMxRz+GsIFdTA/ultVzOeUzRVXXFflm0
         S+KLamoc6zGOp8YbMGF6owYnF2UWga8WEjyzBiGP6fJegHXzzJf5tisq+zVPqD+ATKc8
         P41GEm5JQqEPSiMQ9xhbf52HavIyhUxs3hIeOUzA1gjS6qHzZmZTfS2MIlUwhrReajHz
         +8YvF6eLlmA11CFpVYuPM09CHJJlqDvQvvvMtfQwXvt/rMbf0FEB1oYX9oIg6wOtS895
         T9zecsps1MO8OkAiV3OgCbBbtt2YMQgloTOdguLAFX2OO+f5ryjto98gwhmmiI4lIpGd
         +tSQ==
X-Gm-Message-State: AOJu0YwRyV5Aug2wKzal5sWrCvK9p/q+3ERi82PqNU1cvyXPeTJLie/V
	HIq1t2n8pASdmA/QSuvSPD229IKjEuZk5g==
X-Google-Smtp-Source: AGHT+IGHOQyMA4tjybO1l4f/Tl+5RIJkMRCoFkE7fd0sty8LOmeXR4uLTLcGBO+15QzVpK+fv4S2FQ==
X-Received: by 2002:a17:906:113:b0:9a1:c225:1cea with SMTP id 19-20020a170906011300b009a1c2251ceamr1866727eje.65.1693568907959;
        Fri, 01 Sep 2023 04:48:27 -0700 (PDT)
Received: from [192.168.1.95] (host-176-36-0-241.b024.la.net.ua. [176.36.0.241])
        by smtp.gmail.com with ESMTPSA id s19-20020a170906455300b0098e0a937a6asm1874477ejq.69.2023.09.01.04.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 04:48:27 -0700 (PDT)
Message-ID: <86cd932cd5a6ecf44b3d4dfd2b9446bd721d9e78.camel@gmail.com>
Subject: Re: [bpf:master 6/15] htmldocs: Warning: Documentation/bpf/btf.rst
 references a file that doesn't exist: Documentation/bpf/llvm_reloc
From: Eduard Zingerman <eddyz87@gmail.com>
To: Daniel Borkmann <daniel@iogearbox.net>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Date: Fri, 01 Sep 2023 14:48:26 +0300
In-Reply-To: <5ce81342-c565-f7fb-1c93-ec4eac8944c9@iogearbox.net>
References: <202309010804.G3MpXo59-lkp@intel.com>
	 <6a92003b-e47f-01bc-57d2-d2fb30292ad0@iogearbox.net>
	 <a62b47218f1852d09b243b8fb1741c2baca4d336.camel@gmail.com>
	 <5009129a873cf20adacd679d5073c799f79672d2.camel@gmail.com>
	 <5ce81342-c565-f7fb-1c93-ec4eac8944c9@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2023-09-01 at 13:22 +0200, Daniel Borkmann wrote:
> On 9/1/23 1:18 PM, Eduard Zingerman wrote:
> > On Fri, 2023-09-01 at 12:26 +0300, Eduard Zingerman wrote:
> > > On Fri, 2023-09-01 at 08:29 +0200, Daniel Borkmann wrote:
> > > > Hi Eduard,
> > > >=20
> > > > On 9/1/23 2:05 AM, kernel test robot wrote:
> > > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.g=
it master
> > > > > head:   be8e754cbfac698d6304bb8382c8d18ac74424d3
> > > > > commit: be4033d36070e44fba766a21ef2d0c24fa04c377 [6/15] docs/bpf:=
 Add description for CO-RE relocations
> > > > > reproduce: (https://download.01.org/0day-ci/archive/20230901/2023=
09010804.G3MpXo59-lkp@intel.com/reproduce)
> > > > >=20
> > > > > If you fix the issue in a separate patch/commit (i.e. not just a =
new version of
> > > > > the same patch/commit), kindly add following tags
> > > > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > > > Closes: https://lore.kernel.org/oe-kbuild-all/202309010804.G3Mp=
Xo59-lkp@intel.com/
> > > > >=20
> > > > > All warnings (new ones prefixed by >>):
> > > > >=20
> > > > > > > Warning: Documentation/bpf/btf.rst references a file that doe=
sn't exist: Documentation/bpf/llvm_reloc
> > > > > > > Warning: Documentation/bpf/llvm_reloc.rst references a file t=
hat doesn't exist: Documentation/bpf/btf
> > > >=20
> > > > Could you send a follow-up fix for bpf tree?
> > >=20
> > > Hi Daniel,
> > >=20
> > > Will send the fix shortly. Strangely, I did check this syntax locally
> > > before sending the original patch, and had no warnings reported.
> >=20
> > I followed reproducing instructions but can't trigger this warning,
> > tried several sphinx versions:
> > - 1.7.9
> > - 2.4.4
> > - 4.3.2
> >=20
> > I'll remove 'Documentation/bpf/llvm_reloc' and 'Documentation/bpf/btf'
> > labels from the documents (and these are link labels, not actual
> > links), but it looks like I don't have a way to check the results in a
> > way compatible with test robot.
>=20
> Strange, perhaps LKP folks could chime in and provide some more guidance =
e.g.
> wrt Sphinx version.

...sigh... I rebuilt the kernel and all of a sudden warnings are shown.
Sorry of all the noise, will send the fix soon.

