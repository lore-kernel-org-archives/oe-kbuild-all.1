Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD19F15530C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Feb 2025 14:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740146955; cv=none; b=Fjf5GK3PH1HAtneXurtGS5r+9OiPXkrOxJiqzSnS1ADOfbsDuxPiH7z7uwPVUAr5K2wi2fsboIAM/DS3yJz6rrUr5hO8WC8tIIGptzsa9SEvpopGJf8WeXt+gKn+/UvmjlKDRQzBka7JWSuc0ZqmYRcWJW5DHqF0bCc4G8fnWk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740146955; c=relaxed/simple;
	bh=35Z1H1MxhW5IbndFquA1CYbsZgLoVdLkqwioV4p/xsM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OpZWXaiOaEs5Ui/+KjIRcQ2xravST+DdlZcjH+gcGOTch7x2saOz7yaUUBQbKQfsQRVfMqNB/lSUIutPUt9tnjOR3Gv8U/+SL5kjVmyC9JuYPuBRZ6A8JoLp3XwwBbAGtVUeHTs0ujdLm9AJBFPsYETeSeyJKJDXv1e9S5NY/oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r6vb3S9C; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r6vb3S9C"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5debbced002so4003025a12.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Feb 2025 06:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740146952; x=1740751752; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tZAgktSZZMLiPp9SM2R7Kz9OEAafAnD4jJNlBBN52gA=;
        b=r6vb3S9CC/6Omptz9qHGzwg/1oYZvLWF96Hky0BY3pSv9nlL/crZ6hPPxaYCwBbTDb
         oPOwWacfUXUP1O6KOF/dJQRuamsWe2gVrlnqdnFrJ1jwCSyj5JeAnueh8p3unGHUciia
         Ilu9XW/Dv5I3JeXOe78J94ThL34Sp/pRRZrPtEl8eNwXFgH6Jt5EUfI76SURUj8GH0ac
         Bblsu4Qdg+yOFAnrEc4ajrp3CimbmhS/3Tr3lJvl3Cw9gB6U7lQyy5T+cdL1vrYB/aXP
         amfCIU46nBeWfo37m5Ei1xtFG0hQ9LmDocFreb8w3TkiR4TxnPd46tWbARmLKQoK3j42
         Vdug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740146952; x=1740751752;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tZAgktSZZMLiPp9SM2R7Kz9OEAafAnD4jJNlBBN52gA=;
        b=FDJh3J5BnfiUafFFqgcKWzp3B9CertPlXsWKOe5Cda4/75wqCbLT590joOTOkUSoAk
         f1vvDAvrTZrGV9ECl1RDq01IZfsJ15YsvdkJQVigembMexTFZEd35ScL2TbZJeFy1FLu
         6AGc9eZcD+q9zaKN7dhHbKSQ+7Tg4wy95JaCJikxnEVZT0JbUfz1NLLfZ3qzf+FjJOdo
         gTq49aZVDikYDgsOLvETKPRIDAgi+YO4neXTUeEbuD/8w0hAFNg3L0x+YqqLY5EtMXzz
         enMqbgMBpWy5eSHy9nP5lLgh73HlZqYKZSvPWvj0CDa6akRaoM4vpLV3rQGEd23U2XJs
         VvEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPH8QYzqqre4w0re9MkCMDCFoTJw5zZu/S1fE0UAwRvdj4XI4JbQ4FmwCBOyqzXjDTMKoo/qTIZYW2IXWT@lists.linux.dev
X-Gm-Message-State: AOJu0YxRe9rX3J2sJPomdxsRviySExQuNgjco7eRwe2F974huIB8SXYL
	ZHy70gZgzAiRuAMYABPanbyvV7htEAFAw8VS7HkGL11+ITzHbowuikYxOPU8Njk=
X-Gm-Gg: ASbGnctVaR28iQm/0BHkA8o2P9BI+Z6cevbVvcSqZxZXGqjj6V/cc2tWOG2atXEuRPk
	pWQbJUgotliyyBQG6C40Lz4K4FG5GkHNogRpdQBG/JxN5Keph+jmEazjH3dyQehDcWiX52p6R59
	nTVmOcntJz8XxFGnyt1d+f1b9+oDqdBjV+8ipKi0Bkxe1e4ZA1i8nBch0dihhIftFAV7JeLUrna
	kfW62nMf1zju5Sv/jIr7pqWSKKCh0OCvCDvbgI9LJGY8zV1x/ubQZW2X/wJhxNAMTrhLuPjJnt4
	3c7a8bZU+m7WiDkZU0cKbUEg6GEEeK0=
X-Google-Smtp-Source: AGHT+IFu4aNr9Q8vqGT14g6lIi6T5RIzEuhOS18uu9cyvoWpY3r5Cm7kMhRzVURCA/Yj1ZFehwN9pA==
X-Received: by 2002:a05:6402:13c9:b0:5e0:7df0:6623 with SMTP id 4fb4d7f45d1cf-5e0a1240ec9mr6649040a12.6.1740146951950;
        Fri, 21 Feb 2025 06:09:11 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5dece1d3472sm13672546a12.34.2025.02.21.06.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 06:09:11 -0800 (PST)
Date: Fri, 21 Feb 2025 17:09:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Frederic Weisbecker <frederic@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: kernel/sched/ext.c:5356 scx_create_rt_helper() warn: 'helper' is an
 error pointer or valid
Message-ID: <a4f5658c-9ab3-4547-a6a0-7832f539aa64@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   334426094588f8179fe175a09ecc887ff0c75758
commit: 41f70d8e16349c65abdc0dd88a7d0ab94e5ce639 kthread: Unify kthread_create_on_cpu() and kthread_create_worker_on_cpu() automatic format
config: powerpc-randconfig-r073-20250221 (https://download.01.org/0day-ci/archive/20250221/202502211941.Z5Lgg2UR-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202502211941.Z5Lgg2UR-lkp@intel.com/

smatch warnings:
kernel/sched/ext.c:5356 scx_create_rt_helper() warn: 'helper' is an error pointer or valid
kernel/sched/ext.c:5357 scx_create_rt_helper() error: 'helper' dereferencing possible ERR_PTR()

vim +/helper +5356 kernel/sched/ext.c

f0e1a0643a59bf Tejun Heo 2024-06-18  5351  static struct kthread_worker *scx_create_rt_helper(const char *name)
f0e1a0643a59bf Tejun Heo 2024-06-18  5352  {
f0e1a0643a59bf Tejun Heo 2024-06-18  5353  	struct kthread_worker *helper;
f0e1a0643a59bf Tejun Heo 2024-06-18  5354  
f0e1a0643a59bf Tejun Heo 2024-06-18  5355  	helper = kthread_create_worker(0, name);
f0e1a0643a59bf Tejun Heo 2024-06-18 @5356  	if (helper)

if (!IS_ERR(helper))

f0e1a0643a59bf Tejun Heo 2024-06-18 @5357  		sched_set_fifo(helper->task);
f0e1a0643a59bf Tejun Heo 2024-06-18  5358  	return helper;
f0e1a0643a59bf Tejun Heo 2024-06-18  5359  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

