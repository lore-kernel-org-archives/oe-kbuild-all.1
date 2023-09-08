Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842F84C93
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Sep 2023 16:19:50 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-401b393df02so26301425e9.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 08 Sep 2023 09:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694189988; x=1694794788; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mDFzOanx+BpNbVGy3qDAQpXcV3UnjdmqJ63Po7rTs+Q=;
        b=u03t6fzYSixCcTmrLvke7VcV28BCFIKr5jAGKFNS3S45K/HZVuoMrO/+x5+rfZclTH
         IBC2hAbDL0JWTvI2tMF9C39M/5Nb2xQyib4TC6quaKFPf2ia1+bxetYjPmqlcYZ4wpio
         90BNdJS2nlqLMm3wG3n9j2s+4ejOCTQ4OwSGdP0PwuXylve1hkFip4Qc5Z+LlMaEkwPZ
         ozoD0t/If9WgNwuMjqpBeNsOh1WlZzuoEb2xNghl+0x8kpFsZCaPbjfmtxfaLQ653Ri1
         YbNXr3ll9uuNYPyIVtzxwrZ6gMugQ5hGUcTQ1zGa061rvhMIzpxTohHp/4n+xHN35DzL
         ANcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694189988; x=1694794788;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mDFzOanx+BpNbVGy3qDAQpXcV3UnjdmqJ63Po7rTs+Q=;
        b=lQvYm5l/f9OYUyF0LtBCDy/MsoDc9wxbKjR3AbcM8jWB7iFzePDSMkQkYDn+umx7DZ
         t5BEmC+p4FkqyU1OgsQLGrs8GFWI3fKhS4dFK4YHRg6prnAooV70Q+wJMDonSOm+pN0l
         +QHnzB3/VJXUbEkOs/4EAh71fc0V2uqsEJaiI8dbY3tt01wId+4U/NlgDimPcsw8upJm
         vM7jkblY3xWl7LglXAXH1Eha9a1ZuwYxCvr0Q9BQsJC2JjeDjXLRG/TrkqCc6NIPgZUF
         hwbPFavgmtn8elSy+HpGye3a8W0DoGEuO4MMylAYkHq3j0SeDWYGM75sFkEALWQ2pcEn
         xfAQ==
X-Gm-Message-State: AOJu0YzqDUB7m9R+iroNb0D6lgUvJ0LqY9Iosw1KxbpaueQm+4Olm9+P
	Lj7E+Zhpatx4/VFJzJ/LUVMyHA==
X-Google-Smtp-Source: AGHT+IHI98LB4GDIFEg7lIxqmlCeJmiPjoMLjyle8kGaSLlST3oO0yrhVT64FzWvSZnvz19+ENMEyw==
X-Received: by 2002:a05:6000:1374:b0:317:6e62:b124 with SMTP id q20-20020a056000137400b003176e62b124mr2458373wrz.18.1694189988422;
        Fri, 08 Sep 2023 09:19:48 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x6-20020a5d54c6000000b0031c855d52efsm2427411wrv.87.2023.09.08.09.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Sep 2023 09:19:47 -0700 (PDT)
Date: Fri, 8 Sep 2023 19:19:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Qais Yousef <qyousef@layalina.io>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:sched-setscheduler-hide 12/12] kernel/kthread.c:1570
 param_get_namefmt() warn: variable dereferenced before check 'param' (see
 line 1567)
Message-ID: <6a7a19b2-908e-42e0-9488-a142cff4140b@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux sched-setscheduler-hide
head:   557fb1e21399de5f674beb93fa6793adce124cc2
commit: 557fb1e21399de5f674beb93fa6793adce124cc2 [12/12] kthread: Implement parameter handling logic
config: x86_64-randconfig-161-20230907 (https://download.01.org/0day-ci/archive/20230908/202309081907.lbs9VWMn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230908/202309081907.lbs9VWMn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202309081907.lbs9VWMn-lkp@intel.com/

smatch warnings:
kernel/kthread.c:1570 param_get_namefmt() warn: variable dereferenced before check 'param' (see line 1567)
kernel/kthread.c:1794 param_set_sched_util_min() warn: ignoring unreachable code.

vim +/param +1570 kernel/kthread.c

557fb1e21399de5f Qais Yousef 2023-08-27  1562  static int param_get_namefmt(char *buffer, int len,
557fb1e21399de5f Qais Yousef 2023-08-27  1563  			     const char *name, const char *param)
557fb1e21399de5f Qais Yousef 2023-08-27  1564  {
557fb1e21399de5f Qais Yousef 2023-08-27  1565  	int namelen = strlen(name);
557fb1e21399de5f Qais Yousef 2023-08-27  1566  	int kthreadlen = strlen("kthread.");
557fb1e21399de5f Qais Yousef 2023-08-27 @1567  	int paramlen = strlen(param);
                                                                      ^^^^^
Dereferenced

557fb1e21399de5f Qais Yousef 2023-08-27  1568  	int size = namelen - kthreadlen - paramlen;
557fb1e21399de5f Qais Yousef 2023-08-27  1569  
557fb1e21399de5f Qais Yousef 2023-08-27 @1570  	if (!namelen || !param || size > len)
                                                                 ^^^^^
Checked too late.

557fb1e21399de5f Qais Yousef 2023-08-27  1571  		return -EINVAL;
557fb1e21399de5f Qais Yousef 2023-08-27  1572  
557fb1e21399de5f Qais Yousef 2023-08-27  1573  	strlcpy(buffer, name + kthreadlen, size);
557fb1e21399de5f Qais Yousef 2023-08-27  1574  
557fb1e21399de5f Qais Yousef 2023-08-27  1575  	return 0;
557fb1e21399de5f Qais Yousef 2023-08-27  1576  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

