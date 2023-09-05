Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFCDC2DF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Sep 2023 11:35:13 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-31c479ede21so2129134f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 05 Sep 2023 04:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693913711; x=1694518511; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ce635KO/rVBhGysaXtu/lTxiB6KqevYHP7p3FxKizrk=;
        b=D6E6SaoxNG73F9Ray2PUg1RdlroCoJ+gt/QfFIMqV73TkzyoQF5Uer/TJAOptkhR9G
         6bjhbUjnHdTjmbF9bDs5ZyOWrtla0M9ZvmmhGZLZZcKJSiK161G0U3JENtV5yKS4vHO2
         fWQlAHC7y1EFN8sZXBzq9znytaubipC0iYQh4kFT6hhNaAgvWgPT/dWKoKtiFb5FMfaQ
         m73OZYThTXhoOoZd5M/CqF3mLwPX4xdMW8MtGWcwUlo1VvId7HxiCeI3lbirOYl/WIq4
         v668sgo3jOtISJCOzzyPUGqvXtYioOk48avWyy5HYMHMyEjPJDe6DEcRlgwXv15dGcRr
         iXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693913711; x=1694518511;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ce635KO/rVBhGysaXtu/lTxiB6KqevYHP7p3FxKizrk=;
        b=CQdLFMgyUqNJLgi86D/V2/A0dGU6cfK7hMImlz7nlizB1vNBaM0JLwEs3m7X0kcIBa
         qoXrbh5UleTj1B07pQHA47Agllu2/dHdEgKZJdHdwHM4KCVXHa8Vd2ytGXSq4muMEh0t
         DGjSWB5iN6b39mQ/cqXSjnCD74OmRLCkko+WA/XJ345qd4wzrEs2L2WQiEOvKkatkuzH
         8njPyVx4STl8o+zK84so3SvGTSQphM/WqYnvqWVnAEqmpqji64L0yH31tSJJVQZiiCpc
         8BYyE0KzdcSPlQz2rvlyq5gOGb1D9IFREQ8BJbZySJ1wYizTPkWHWzNPjtlSQPmB8HuG
         z0JA==
X-Gm-Message-State: AOJu0YwS2+tBNmnC0FlDCp/FLkDdrtEzhefI99vkap4KpcrppsOpr3He
	4UqNhUu3FuMelPYh/UDv4A9EvQ==
X-Google-Smtp-Source: AGHT+IEBmP2byFUvFjzEorXj6zB2IpTq9ZyQjmDbLbU/a8KO4eJucHLJxN/UKZ7+Rlk05L/EogDjWg==
X-Received: by 2002:a5d:43d0:0:b0:317:5747:b955 with SMTP id v16-20020a5d43d0000000b003175747b955mr9913590wrr.17.1693913711258;
        Tue, 05 Sep 2023 04:35:11 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n4-20020a5d4844000000b0031ad5470f89sm17195261wrs.18.2023.09.05.04.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 04:35:11 -0700 (PDT)
Date: Tue, 5 Sep 2023 14:35:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Amir Goldstein <amir73il@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fuse-backing-fd 11/14] fs/fuse/passthrough.c:23
 fuse_backing_free() error: we previously assumed 'fb' could be null (see
 line 21)
Message-ID: <1e6272d6-d7d4-40f0-95f9-5171afce9c9c@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fuse-backing-fd
head:   563a1dbd5121cbe0239528370c886b990224403f
commit: c437debbc26ca8097efb08e5f279b4bd5c8376a3 [11/14] fuse: backing file id initialization and release
config: i386-randconfig-141-20230903 (https://download.01.org/0day-ci/archive/20230903/202309031342.V3G49Lbc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230903/202309031342.V3G49Lbc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202309031342.V3G49Lbc-lkp@intel.com/

smatch warnings:
fs/fuse/passthrough.c:23 fuse_backing_free() error: we previously assumed 'fb' could be null (see line 21)

vim +/fb +23 fs/fuse/passthrough.c

96e6d03cee90a5 Amir Goldstein 2023-05-20  19  static void fuse_backing_free(struct fuse_backing *fb)
96e6d03cee90a5 Amir Goldstein 2023-05-20  20  {
96e6d03cee90a5 Amir Goldstein 2023-05-20 @21  	if (fb && fb->file)
                                                    ^^
Is this check necessary?

96e6d03cee90a5 Amir Goldstein 2023-05-20  22  		fput(fb->file);
c437debbc26ca8 Amir Goldstein 2023-09-02 @23  	if (fb->cred)
                                                    ^^^^
Unchecked dereference.

c437debbc26ca8 Amir Goldstein 2023-09-02  24  		put_cred(fb->cred);
c437debbc26ca8 Amir Goldstein 2023-09-02  25  	kfree_rcu(fb, rcu);
96e6d03cee90a5 Amir Goldstein 2023-05-20  26  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

