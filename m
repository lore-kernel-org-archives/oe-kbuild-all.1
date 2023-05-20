Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497FF372
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 May 2023 08:36:22 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3094871953bso1844746f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 20 May 2023 01:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684571780; x=1687163780;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HANssJaIzkynE0ReZdunQUuw0natAlnfam+GL8W2kig=;
        b=lM76OoAqTpWUIknRrI9hInriF6Yl5w9pHWur0AyCtVDTEutKWUezT3z3SElnJAN/4U
         SL3KCHo0M6pFjNh69y12qrMJrH+H+Gep0y+R2XF9ZEtFMi7RE5JLUPNBvcT9Y6IEFvGa
         sJFfKAC32PgMiGetD0vUJzqXl3Vr1XR/YsUPRbfBPpPf0lOCzbnz6LlRiUFKkTozSG+J
         KzDTsIeDR7XcAE4GR0mM07XE0iyDsaQbI4nJdhfWPLCfOmOEfThGv6bxD4ljNapMEsDe
         X7IMQRQuLOcaCQMsHhLSfhqnKlAP0LvrpGeoNlL/XufkVoGJgFT37TWudqyhqbN2qj+E
         Ng8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684571780; x=1687163780;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HANssJaIzkynE0ReZdunQUuw0natAlnfam+GL8W2kig=;
        b=HdPZVELjbCtv60dhhq//lw0fTLjAcKjwPhxGsFGzU7lob7q/hnb++4tdkD6d9iv1gJ
         wsEH/ce4cq9kms+rz/wqKTCN6A31SEgeXiCnBuDuDwxjRaqkNS5OR2L0c46uocJiLZZI
         8akqdxBwbp/HyDIoeRwFYQonVowu2nragEPTmotXC2e8ceUzSuu9wGc661cMxMXHrrHo
         Mod8dMza+Oi1vVuaXdsqjyVzX2QXxviowdNzoGl4EePCARflZXVNXny7YBAtpH+lfAED
         wpVaYWQxkH6C99HT5wDT6ReOlomkOFng/sV9WnbqhidY2NLrjfjuh3kMs75sMJ6qSiJK
         Qb2Q==
X-Gm-Message-State: AC+VfDwuhpNTBo+vU+VsISlLog7Xwlu7XwuXepxKN7vjuhuCWPNoeqfU
	qCebW+8I+tRPM9qAFTEgCcZCCg==
X-Google-Smtp-Source: ACHHUZ68iCuc41EGkNfQxrcBuH+noVZU+20B0Pw87u2deRkylddDirNeFL+WXQB5Uo8gqpdobNIO1w==
X-Received: by 2002:a5d:4385:0:b0:309:436a:fc2f with SMTP id i5-20020a5d4385000000b00309436afc2fmr2775303wrq.57.1684571780546;
        Sat, 20 May 2023 01:36:20 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id s24-20020a1cf218000000b003f4f1b884cdsm4767618wmc.36.2023.05.20.01.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 May 2023 01:36:19 -0700 (PDT)
Date: Sat, 20 May 2023 11:36:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Amir Goldstein <amir73il@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fuse-passthrough-fd 6/10] fs/fuse/passthrough.c:245
 fuse_passthrough_free() error: we previously assumed 'passthrough' could be
 null (see line 241)
Message-ID: <3d1a3b7c-ba9b-49d9-ab00-ecb98fa93fea@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fuse-passthrough-fd
head:   f361a719d9f68b1d77efdaafffb189df34bb5733
commit: e1e6ad0be538e08c255c6554bf85a7ed1b244ca7 [6/10] fuse: Use daemon creds in passthrough mode
config: i386-randconfig-m021
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305201412.U8As1nkW-lkp@intel.com/

smatch warnings:
fs/fuse/passthrough.c:245 fuse_passthrough_free() error: we previously assumed 'passthrough' could be null (see line 241)

vim +/passthrough +245 fs/fuse/passthrough.c

badffde4dae9ed Alessio Balsini 2020-10-26  239  void fuse_passthrough_free(struct fuse_passthrough *passthrough)
badffde4dae9ed Alessio Balsini 2020-10-26  240  {
badffde4dae9ed Alessio Balsini 2020-10-26 @241  	if (passthrough && passthrough->filp) {
                                                            ^^^^^^^^^^^
Is this check required?

badffde4dae9ed Alessio Balsini 2020-10-26  242  		fput(passthrough->filp);
badffde4dae9ed Alessio Balsini 2020-10-26  243  		passthrough->filp = NULL;
badffde4dae9ed Alessio Balsini 2020-10-26  244  	}
e1e6ad0be538e0 Amir Goldstein  2023-05-17 @245  	if (passthrough->cred) {
                                                            ^^^^^^^^^^^^^
Not checked here.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

