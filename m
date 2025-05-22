Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894574A1A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 May 2025 02:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747880212; cv=none; b=pS9JaFEuVkqknZ8s4zykW5+PiZSvmcN7XjMC5mGgwxQOhfozxZDmINFEfWXU2AElAqXICI4dwMM0sPl3J2IEGMwQG+Iwd0ftBdeJVhkITRqPY/dLkLtUkp9dekg3Twoc3mLwujyK6C56y+1Sw+dL1DCYilA/pvuahNUrLSNNfqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747880212; c=relaxed/simple;
	bh=BQfT1Z7MrNn0i60kSziNkVhJIgfLfHF52bQ8YZ0gv/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ciWdbT8EopX7vKup4qFao+Nl+cQQ2Aapiop8lA7JczD4VqSNs+DFYPs3byAWkwkAbBWCefmNVdKNV0VMyw8k15b2qtBD0KfqGQJ91+VSmaqfH4MzZQwQOl61cJ6qVbKUYm/B7P6wsWJVcZibcGTo17nTCqdsf3e6W0/U0YhV6M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V+wqFfwR; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V+wqFfwR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747880210; x=1779416210;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BQfT1Z7MrNn0i60kSziNkVhJIgfLfHF52bQ8YZ0gv/I=;
  b=V+wqFfwR6XfsXluodHpJtJsJrRccQ1DOu0d0RC/FeQBD+pQgPiXt3/mD
   WVNqaJgTY8jc+fnb3UTziUtg5CALCgJYK031unNkStTKgAPR096LfZ+Tj
   A0Agbc36IWijuJkl7a+ll706P6ZBXQ9ujwgZNo+y5huMjn7jujbwouMi5
   HIRq9fUnwGsIItRhQekw7Dd6phcvE3z+AbjL7Cx1iZ4PULonjFsMkz6J+
   VRv539O+Le6cg3YzkL8lU7YdmAytCLictkWdwJc2tZaGIzG1ojAFkoZ4Q
   W6nZP9Bov5nA7khbPmVWmD7IEUXu3DPThSu5ztomMeU7i2q1lT+n8qKG/
   g==;
X-CSE-ConnectionGUID: mRikkp3BRHKfQRvjaVI2Wg==
X-CSE-MsgGUID: P/iSZwNxSFukEtoEm6hlIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49874594"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="49874594"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 19:16:49 -0700
X-CSE-ConnectionGUID: 32dze8U9TRyzI87+8CinUw==
X-CSE-MsgGUID: XYBGOS6uSxSFUAaZllYZNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="177527177"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 May 2025 19:16:42 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHvU7-000Opc-0p;
	Thu, 22 May 2025 02:16:39 +0000
Date: Thu, 22 May 2025 10:15:54 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
	Min Ma <min.ma@amd.com>, Lizhi Hou <lizhi.hou@amd.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Lucas Stach <l.stach@pengutronix.de>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Philipp Stanner <phasta@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v10 02/10] drm/sched: Store the drm client_id in
 drm_sched_fence
Message-ID: <202505220910.4vL2lLLi-lkp@intel.com>
References: <20250521154531.10541-3-pierre-eric.pelloux-prayer@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521154531.10541-3-pierre-eric.pelloux-prayer@amd.com>

Hi Pierre-Eric,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on next-20250521]
[cannot apply to lwn/docs-next linus/master v6.15-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pierre-Eric-Pelloux-Prayer/drm-debugfs-Output-client_id-in-in-drm_clients_info/20250521-235024
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250521154531.10541-3-pierre-eric.pelloux-prayer%40amd.com
patch subject: [PATCH v10 02/10] drm/sched: Store the drm client_id in drm_sched_fence
config: csky-randconfig-002-20250522 (https://download.01.org/0day-ci/archive/20250522/202505220910.4vL2lLLi-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505220910.4vL2lLLi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505220910.4vL2lLLi-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/scheduler/tests/mock_scheduler.c: In function 'drm_mock_sched_entity_new':
>> drivers/gpu/drm/scheduler/tests/mock_scheduler.c:35:15: error: too many arguments to function 'drm_sched_entity_init'; expected 5, have 6
      35 |         ret = drm_sched_entity_init(&entity->base,
         |               ^~~~~~~~~~~~~~~~~~~~~
   ......
      38 |                                     NULL, 1);
         |                                           ~
   In file included from drivers/gpu/drm/scheduler/tests/sched_tests.h:18,
                    from drivers/gpu/drm/scheduler/tests/mock_scheduler.c:4:
   include/drm/gpu_scheduler.h:668:5: note: declared here
     668 | int drm_sched_entity_init(struct drm_sched_entity *entity,
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/scheduler/tests/mock_scheduler.c: In function 'drm_mock_sched_job_new':
>> drivers/gpu/drm/scheduler/tests/mock_scheduler.c:117:15: error: too few arguments to function 'drm_sched_job_init'; expected 5, have 4
     117 |         ret = drm_sched_job_init(&job->base,
         |               ^~~~~~~~~~~~~~~~~~
   include/drm/gpu_scheduler.h:637:5: note: declared here
     637 | int drm_sched_job_init(struct drm_sched_job *job,
         |     ^~~~~~~~~~~~~~~~~~


vim +/drm_sched_entity_init +35 drivers/gpu/drm/scheduler/tests/mock_scheduler.c

5a99350794fec11 Tvrtko Ursulin             2025-03-24    5  
5a99350794fec11 Tvrtko Ursulin             2025-03-24    6  /*
5a99350794fec11 Tvrtko Ursulin             2025-03-24    7   * Here we implement the mock "GPU" (or the scheduler backend) which is used by
5a99350794fec11 Tvrtko Ursulin             2025-03-24    8   * the DRM scheduler unit tests in order to exercise the core functionality.
5a99350794fec11 Tvrtko Ursulin             2025-03-24    9   *
5a99350794fec11 Tvrtko Ursulin             2025-03-24   10   * Test cases are implemented in a separate file.
5a99350794fec11 Tvrtko Ursulin             2025-03-24   11   */
5a99350794fec11 Tvrtko Ursulin             2025-03-24   12  
5a99350794fec11 Tvrtko Ursulin             2025-03-24   13  /**
5a99350794fec11 Tvrtko Ursulin             2025-03-24   14   * drm_mock_sched_entity_new - Create a new mock scheduler entity
5a99350794fec11 Tvrtko Ursulin             2025-03-24   15   *
5a99350794fec11 Tvrtko Ursulin             2025-03-24   16   * @test: KUnit test owning the entity
5a99350794fec11 Tvrtko Ursulin             2025-03-24   17   * @priority: Scheduling priority
5a99350794fec11 Tvrtko Ursulin             2025-03-24   18   * @sched: Mock scheduler on which the entity can be scheduled
5a99350794fec11 Tvrtko Ursulin             2025-03-24   19   *
5a99350794fec11 Tvrtko Ursulin             2025-03-24   20   * Returns: New mock scheduler entity with allocation managed by the test
5a99350794fec11 Tvrtko Ursulin             2025-03-24   21   */
5a99350794fec11 Tvrtko Ursulin             2025-03-24   22  struct drm_mock_sched_entity *
5a99350794fec11 Tvrtko Ursulin             2025-03-24   23  drm_mock_sched_entity_new(struct kunit *test,
5a99350794fec11 Tvrtko Ursulin             2025-03-24   24  			  enum drm_sched_priority priority,
5a99350794fec11 Tvrtko Ursulin             2025-03-24   25  			  struct drm_mock_scheduler *sched)
5a99350794fec11 Tvrtko Ursulin             2025-03-24   26  {
5a99350794fec11 Tvrtko Ursulin             2025-03-24   27  	struct drm_mock_sched_entity *entity;
5a99350794fec11 Tvrtko Ursulin             2025-03-24   28  	struct drm_gpu_scheduler *drm_sched;
5a99350794fec11 Tvrtko Ursulin             2025-03-24   29  	int ret;
5a99350794fec11 Tvrtko Ursulin             2025-03-24   30  
5a99350794fec11 Tvrtko Ursulin             2025-03-24   31  	entity = kunit_kzalloc(test, sizeof(*entity), GFP_KERNEL);
5a99350794fec11 Tvrtko Ursulin             2025-03-24   32  	KUNIT_ASSERT_NOT_NULL(test, entity);
5a99350794fec11 Tvrtko Ursulin             2025-03-24   33  
5a99350794fec11 Tvrtko Ursulin             2025-03-24   34  	drm_sched = &sched->base;
5a99350794fec11 Tvrtko Ursulin             2025-03-24  @35  	ret = drm_sched_entity_init(&entity->base,
5a99350794fec11 Tvrtko Ursulin             2025-03-24   36  				    priority,
5a99350794fec11 Tvrtko Ursulin             2025-03-24   37  				    &drm_sched, 1,
9452e5ac75e0cf6 Pierre-Eric Pelloux-Prayer 2025-05-21   38  				    NULL, 1);
5a99350794fec11 Tvrtko Ursulin             2025-03-24   39  	KUNIT_ASSERT_EQ(test, ret, 0);
5a99350794fec11 Tvrtko Ursulin             2025-03-24   40  
5a99350794fec11 Tvrtko Ursulin             2025-03-24   41  	entity->test = test;
5a99350794fec11 Tvrtko Ursulin             2025-03-24   42  
5a99350794fec11 Tvrtko Ursulin             2025-03-24   43  	return entity;
5a99350794fec11 Tvrtko Ursulin             2025-03-24   44  }
5a99350794fec11 Tvrtko Ursulin             2025-03-24   45  
5a99350794fec11 Tvrtko Ursulin             2025-03-24   46  /**
5a99350794fec11 Tvrtko Ursulin             2025-03-24   47   * drm_mock_sched_entity_free - Destroys a mock scheduler entity
5a99350794fec11 Tvrtko Ursulin             2025-03-24   48   *
5a99350794fec11 Tvrtko Ursulin             2025-03-24   49   * @entity: Entity to destroy
5a99350794fec11 Tvrtko Ursulin             2025-03-24   50   *
5a99350794fec11 Tvrtko Ursulin             2025-03-24   51   * To be used from the test cases once done with the entity.
5a99350794fec11 Tvrtko Ursulin             2025-03-24   52   */
5a99350794fec11 Tvrtko Ursulin             2025-03-24   53  void drm_mock_sched_entity_free(struct drm_mock_sched_entity *entity)
5a99350794fec11 Tvrtko Ursulin             2025-03-24   54  {
5a99350794fec11 Tvrtko Ursulin             2025-03-24   55  	drm_sched_entity_destroy(&entity->base);
5a99350794fec11 Tvrtko Ursulin             2025-03-24   56  }
5a99350794fec11 Tvrtko Ursulin             2025-03-24   57  
5a99350794fec11 Tvrtko Ursulin             2025-03-24   58  static void drm_mock_sched_job_complete(struct drm_mock_sched_job *job)
5a99350794fec11 Tvrtko Ursulin             2025-03-24   59  {
5a99350794fec11 Tvrtko Ursulin             2025-03-24   60  	struct drm_mock_scheduler *sched =
5a99350794fec11 Tvrtko Ursulin             2025-03-24   61  		drm_sched_to_mock_sched(job->base.sched);
5a99350794fec11 Tvrtko Ursulin             2025-03-24   62  
5a99350794fec11 Tvrtko Ursulin             2025-03-24   63  	lockdep_assert_held(&sched->lock);
5a99350794fec11 Tvrtko Ursulin             2025-03-24   64  
5a99350794fec11 Tvrtko Ursulin             2025-03-24   65  	job->flags |= DRM_MOCK_SCHED_JOB_DONE;
5a99350794fec11 Tvrtko Ursulin             2025-03-24   66  	list_move_tail(&job->link, &sched->done_list);
5a99350794fec11 Tvrtko Ursulin             2025-03-24   67  	dma_fence_signal(&job->hw_fence);
5a99350794fec11 Tvrtko Ursulin             2025-03-24   68  	complete(&job->done);
5a99350794fec11 Tvrtko Ursulin             2025-03-24   69  }
5a99350794fec11 Tvrtko Ursulin             2025-03-24   70  
5a99350794fec11 Tvrtko Ursulin             2025-03-24   71  static enum hrtimer_restart
5a99350794fec11 Tvrtko Ursulin             2025-03-24   72  drm_mock_sched_job_signal_timer(struct hrtimer *hrtimer)
5a99350794fec11 Tvrtko Ursulin             2025-03-24   73  {
5a99350794fec11 Tvrtko Ursulin             2025-03-24   74  	struct drm_mock_sched_job *job =
5a99350794fec11 Tvrtko Ursulin             2025-03-24   75  		container_of(hrtimer, typeof(*job), timer);
5a99350794fec11 Tvrtko Ursulin             2025-03-24   76  	struct drm_mock_scheduler *sched =
5a99350794fec11 Tvrtko Ursulin             2025-03-24   77  		drm_sched_to_mock_sched(job->base.sched);
5a99350794fec11 Tvrtko Ursulin             2025-03-24   78  	struct drm_mock_sched_job *next;
5a99350794fec11 Tvrtko Ursulin             2025-03-24   79  	ktime_t now = ktime_get();
5a99350794fec11 Tvrtko Ursulin             2025-03-24   80  	unsigned long flags;
5a99350794fec11 Tvrtko Ursulin             2025-03-24   81  	LIST_HEAD(signal);
5a99350794fec11 Tvrtko Ursulin             2025-03-24   82  
5a99350794fec11 Tvrtko Ursulin             2025-03-24   83  	spin_lock_irqsave(&sched->lock, flags);
5a99350794fec11 Tvrtko Ursulin             2025-03-24   84  	list_for_each_entry_safe(job, next, &sched->job_list, link) {
5a99350794fec11 Tvrtko Ursulin             2025-03-24   85  		if (!job->duration_us)
5a99350794fec11 Tvrtko Ursulin             2025-03-24   86  			break;
5a99350794fec11 Tvrtko Ursulin             2025-03-24   87  
5a99350794fec11 Tvrtko Ursulin             2025-03-24   88  		if (ktime_before(now, job->finish_at))
5a99350794fec11 Tvrtko Ursulin             2025-03-24   89  			break;
5a99350794fec11 Tvrtko Ursulin             2025-03-24   90  
5a99350794fec11 Tvrtko Ursulin             2025-03-24   91  		sched->hw_timeline.cur_seqno = job->hw_fence.seqno;
5a99350794fec11 Tvrtko Ursulin             2025-03-24   92  		drm_mock_sched_job_complete(job);
5a99350794fec11 Tvrtko Ursulin             2025-03-24   93  	}
5a99350794fec11 Tvrtko Ursulin             2025-03-24   94  	spin_unlock_irqrestore(&sched->lock, flags);
5a99350794fec11 Tvrtko Ursulin             2025-03-24   95  
5a99350794fec11 Tvrtko Ursulin             2025-03-24   96  	return HRTIMER_NORESTART;
5a99350794fec11 Tvrtko Ursulin             2025-03-24   97  }
5a99350794fec11 Tvrtko Ursulin             2025-03-24   98  
5a99350794fec11 Tvrtko Ursulin             2025-03-24   99  /**
5a99350794fec11 Tvrtko Ursulin             2025-03-24  100   * drm_mock_sched_job_new - Create a new mock scheduler job
5a99350794fec11 Tvrtko Ursulin             2025-03-24  101   *
5a99350794fec11 Tvrtko Ursulin             2025-03-24  102   * @test: KUnit test owning the job
5a99350794fec11 Tvrtko Ursulin             2025-03-24  103   * @entity: Scheduler entity of the job
5a99350794fec11 Tvrtko Ursulin             2025-03-24  104   *
5a99350794fec11 Tvrtko Ursulin             2025-03-24  105   * Returns: New mock scheduler job with allocation managed by the test
5a99350794fec11 Tvrtko Ursulin             2025-03-24  106   */
5a99350794fec11 Tvrtko Ursulin             2025-03-24  107  struct drm_mock_sched_job *
5a99350794fec11 Tvrtko Ursulin             2025-03-24  108  drm_mock_sched_job_new(struct kunit *test,
5a99350794fec11 Tvrtko Ursulin             2025-03-24  109  		       struct drm_mock_sched_entity *entity)
5a99350794fec11 Tvrtko Ursulin             2025-03-24  110  {
5a99350794fec11 Tvrtko Ursulin             2025-03-24  111  	struct drm_mock_sched_job *job;
5a99350794fec11 Tvrtko Ursulin             2025-03-24  112  	int ret;
5a99350794fec11 Tvrtko Ursulin             2025-03-24  113  
5a99350794fec11 Tvrtko Ursulin             2025-03-24  114  	job = kunit_kzalloc(test, sizeof(*job), GFP_KERNEL);
5a99350794fec11 Tvrtko Ursulin             2025-03-24  115  	KUNIT_ASSERT_NOT_NULL(test, job);
5a99350794fec11 Tvrtko Ursulin             2025-03-24  116  
5a99350794fec11 Tvrtko Ursulin             2025-03-24 @117  	ret = drm_sched_job_init(&job->base,
5a99350794fec11 Tvrtko Ursulin             2025-03-24  118  				 &entity->base,
5a99350794fec11 Tvrtko Ursulin             2025-03-24  119  				 1,
5a99350794fec11 Tvrtko Ursulin             2025-03-24  120  				 NULL);
5a99350794fec11 Tvrtko Ursulin             2025-03-24  121  	KUNIT_ASSERT_EQ(test, ret, 0);
5a99350794fec11 Tvrtko Ursulin             2025-03-24  122  
5a99350794fec11 Tvrtko Ursulin             2025-03-24  123  	job->test = test;
5a99350794fec11 Tvrtko Ursulin             2025-03-24  124  
5a99350794fec11 Tvrtko Ursulin             2025-03-24  125  	init_completion(&job->done);
5a99350794fec11 Tvrtko Ursulin             2025-03-24  126  	spin_lock_init(&job->lock);
5a99350794fec11 Tvrtko Ursulin             2025-03-24  127  	INIT_LIST_HEAD(&job->link);
1afba39f9305fe4 Thomas Zimmermann          2025-04-07  128  	hrtimer_setup(&job->timer, drm_mock_sched_job_signal_timer,
1afba39f9305fe4 Thomas Zimmermann          2025-04-07  129  		      CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
5a99350794fec11 Tvrtko Ursulin             2025-03-24  130  
5a99350794fec11 Tvrtko Ursulin             2025-03-24  131  	return job;
5a99350794fec11 Tvrtko Ursulin             2025-03-24  132  }
5a99350794fec11 Tvrtko Ursulin             2025-03-24  133  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
