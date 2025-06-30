Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AC42900B2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jun 2025 16:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751299970; cv=none; b=R290pnXBEm0Gq3S46lR2YL3HdRcRlMHTRXp63fxpj3D1Dh20eTseED1j+6LbtsmOPkdS5nvw0+wZDzpg6hdZXGNvY9Cy1IdaFuufYun8JgDdysYhIy0qMdQgMegSOwi4a5g4vBGumR4Tgi3Pbdf6SLFS1gFVslz2hCn3HYOr4Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751299970; c=relaxed/simple;
	bh=q4VIj35HGYUMrlmf/wPQyD4fjoYIUJIrYvqyNvRayR4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=VfaYq6bJGhGrKrOKQkPFwjTQTKEQjfDblEyN0PAJCzMhPFQKyM1wir76OWwsLiQDjEw0ybotEMSydHEQA71AlmMdIDDR0axTaizMDw4FCAVaWcEhkqfMPL52VIVINYbCMg5Vkgr/17FuT2LDeh5gdUJOllqPztR3wNmQNxqprrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WVtBJIbO; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WVtBJIbO"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-73b1fbe64a6so277734a34.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jun 2025 09:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751299968; x=1751904768; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pdpheBuXy6YZBSAAaSyOQsX5JfXKwGuw8lus8OBrp2Y=;
        b=WVtBJIbOlhvadGV/FGe0+KmZqiNh6vor8rL2yQLoj2HbKfBvaqfjxP/jEU+i9cJYLt
         yphjdi6W8htSloxqYzFqzeb7/wfAqnNud/JPSWNKn/R2kZj5bJm3A5W3PGxWBylRoZdD
         MMuGPpr8FOYI37+djNjzBayvuLeArKJGcumk3w3P6Khtl7v14xCFVQ5ve7PMRVhTbMd2
         gqMSG5Jj3tNAdOQYzGuvcmlkDA6bHyrIg6JZUgh9tmYbM/BQef9TnWk16mvZC9mL9wk5
         bZvH7eyuvgbOXDRZkL6If/d0STk4oeD0L0Jw+lhu10l9dQUWl09djTE7iycoOjkjCuA7
         k77g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751299968; x=1751904768;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pdpheBuXy6YZBSAAaSyOQsX5JfXKwGuw8lus8OBrp2Y=;
        b=pYq4TWW65N33I8stnBmwwfyfK+87/jDhG+uz2JO7O99xEuVXooe76ZgkL+eQlTKsTo
         cYwyKzvi1/O/Bnzm2iZmCemtn9DOaZkDyLnxFuNyCwaesHxNlZ5TLUWT2NVErztj5jz1
         r2Ckw+Z0SQNW8iZV+D8jqIW9rSfIoePgukXN4OGz57D1G73/lr19J4M/JgGu+5B9zU2C
         /RloD3D07HAIxDLMhe1KDcLVseKVs8/CLGO3fpEHQF55ted21pGkvLabkTTwkbGkYC2g
         MTN6ncoDues5dG842QwG9e+ADUEciw4x1F0u2l95gH83vp5x4KqFsptEimvYwQ2EDpE2
         jHaA==
X-Forwarded-Encrypted: i=1; AJvYcCXduITndVKEMU9/N0uu4kfI1HBLON/hwPsCwOs5bLXEek8k+uJrWV+Dq2Vn5aCkEmC8SLvCbZjwq7j3SLEI@lists.linux.dev
X-Gm-Message-State: AOJu0YxzbUGAYAYo6GyOW6YLlaBEfrt/MQqSYTVnauASsmV+fHHGPt0F
	unKr5Q+gOFzv+b1516QLksQNgi04j1yeDDlEFCMLHtsqslaz8ugdIynPZxdNtTJBq8o=
X-Gm-Gg: ASbGnctMH+oI8L9ownpN3gBtCCeU/xb5bJVM0KOe99AQo/CV41g0egjWgRvmo1x5D1H
	37d9dyFC1eG5I3CbE5m2/oex+GhCB/CLg6hFSdEhea8V+GZh/soNyN9FimYQ2OnQLObTkb2Daf7
	W7+uFMqnTtXeE3OoiYUA+5JHLAHAfe8CVlt21ZrKz+xP2XbmcLSHfCAinSGd7VYG9HMVZx0k0eG
	CelbtSVxOmvUInevrLxE1LUiQfx3VdzSnFAHdQOa2fU4OsGkCeOD5mD2jXrkTupGrV4D24q21V3
	+/T8g+lQBmxcA8fAaz4e0OGryH6bjri6LG3i0VlpupMdU3JBoAzkYjRUFSz3+Im3ahj3cYDBWa2
	b/LY=
X-Google-Smtp-Source: AGHT+IE+3YuCeYJGJwDn+sNWhMGj764qlZlwHp5410p/o2A5QqpknTmv1v4Do0ZjuVRqdyPgQ/jIbQ==
X-Received: by 2002:a05:6830:2c0a:b0:72b:a9f0:50 with SMTP id 46e09a7af769-73afc57dacdmr7936452a34.6.1751299967924;
        Mon, 30 Jun 2025 09:12:47 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:fb67:363d:328:e253])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afb0e47f8sm1717811a34.43.2025.06.30.09.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 09:12:47 -0700 (PDT)
Date: Mon, 30 Jun 2025 19:12:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	jacopo.mondi@ideasonboard.com,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH v2 2/3] media: mc: Add media jobs framework
Message-ID: <24a14a22-9798-420e-b515-87183e898137@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624-media-jobs-v2-2-8e649b069a96@ideasonboard.com>

Hi Daniel,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Scally/media-mc-entity-Add-pipeline_started-stopped-ops/20250624-160120
base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
patch link:    https://lore.kernel.org/r/20250624-media-jobs-v2-2-8e649b069a96%40ideasonboard.com
patch subject: [PATCH v2 2/3] media: mc: Add media jobs framework
config: nios2-randconfig-r073-20250627 (https://download.01.org/0day-ci/archive/20250628/202506282351.uufwOAwG-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506282351.uufwOAwG-lkp@intel.com/

New smatch warnings:
drivers/media/mc/mc-jobs.c:285 __media_jobs_run_jobs() error: we previously assumed 'step->run_step' could be null (see line 281)

vim +285 drivers/media/mc/mc-jobs.c

4be0a59bfc044b0 Daniel Scally 2025-06-24  257  static void __media_jobs_run_jobs(struct work_struct *work)
4be0a59bfc044b0 Daniel Scally 2025-06-24  258  {
4be0a59bfc044b0 Daniel Scally 2025-06-24  259  	struct media_job_scheduler *sched = container_of(work,
4be0a59bfc044b0 Daniel Scally 2025-06-24  260  							 struct media_job_scheduler,
4be0a59bfc044b0 Daniel Scally 2025-06-24  261  							 work);
4be0a59bfc044b0 Daniel Scally 2025-06-24  262  	struct media_job_step *step;
4be0a59bfc044b0 Daniel Scally 2025-06-24  263  	struct media_job *job;
4be0a59bfc044b0 Daniel Scally 2025-06-24  264  
4be0a59bfc044b0 Daniel Scally 2025-06-24  265  	while (true) {
4be0a59bfc044b0 Daniel Scally 2025-06-24  266  		scoped_guard(spinlock, &sched->lock) {
4be0a59bfc044b0 Daniel Scally 2025-06-24  267  			if (list_empty(&sched->queue))
4be0a59bfc044b0 Daniel Scally 2025-06-24  268  				return;
4be0a59bfc044b0 Daniel Scally 2025-06-24  269  
4be0a59bfc044b0 Daniel Scally 2025-06-24  270  			job = list_first_entry(&sched->queue, struct media_job,
4be0a59bfc044b0 Daniel Scally 2025-06-24  271  					       list);
4be0a59bfc044b0 Daniel Scally 2025-06-24  272  
4be0a59bfc044b0 Daniel Scally 2025-06-24  273  			list_del(&job->list);
4be0a59bfc044b0 Daniel Scally 2025-06-24  274  		}
4be0a59bfc044b0 Daniel Scally 2025-06-24  275  
4be0a59bfc044b0 Daniel Scally 2025-06-24  276  		list_for_each_entry(step, &job->steps, list) {
4be0a59bfc044b0 Daniel Scally 2025-06-24  277  			/*
4be0a59bfc044b0 Daniel Scally 2025-06-24  278  			 * Theoretically impossible as this should have been
4be0a59bfc044b0 Daniel Scally 2025-06-24  279  			 * validated in media_jobs_add_job_step()
4be0a59bfc044b0 Daniel Scally 2025-06-24  280  			 */
4be0a59bfc044b0 Daniel Scally 2025-06-24 @281  			if (!step->run_step)
4be0a59bfc044b0 Daniel Scally 2025-06-24  282  				WARN_ONCE(1, "%s(): No .run_step() operation\n",
4be0a59bfc044b0 Daniel Scally 2025-06-24  283  					  __func__);

We print a warning and then crash...  The NULL dereference
will have the same stack trace that the WARN_ONCE() does.

4be0a59bfc044b0 Daniel Scally 2025-06-24  284  
4be0a59bfc044b0 Daniel Scally 2025-06-24 @285  			step->run_step(step->data);
4be0a59bfc044b0 Daniel Scally 2025-06-24  286  		}
4be0a59bfc044b0 Daniel Scally 2025-06-24  287  
4be0a59bfc044b0 Daniel Scally 2025-06-24  288  		media_jobs_free_job(job);
4be0a59bfc044b0 Daniel Scally 2025-06-24  289  	}
4be0a59bfc044b0 Daniel Scally 2025-06-24  290  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

