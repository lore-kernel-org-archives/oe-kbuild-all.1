Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AD6D8835
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Mar 2023 17:05:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9F47106F;
	Fri, 31 Mar 2023 10:06:01 -0700 (PDT)
Received: from [10.1.196.177] (eglon.cambridge.arm.com [10.1.196.177])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D78403F6C4;
	Fri, 31 Mar 2023 10:05:14 -0700 (PDT)
Message-ID: <0b3722b1-0a0c-c934-dd25-e940386dc8d9@arm.com>
Date: Fri, 31 Mar 2023 18:05:13 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 5/6] firmware: smccc: Allow errata management to be
 overridden by device tree
Content-Language: en-GB
To: kernel test robot <lkp@intel.com>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20230330165128.3237939-6-james.morse@arm.com>
 <202303310444.3JHIsByA-lkp@intel.com>
From: James Morse <james.morse@arm.com>
In-Reply-To: <202303310444.3JHIsByA-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/03/2023 21:44, kernel test robot wrote:
> I love your patch! Perhaps something to improve:

> All warnings (new ones prefixed by >>):
> 
>>> drivers/firmware/smccc/em.c:142:5: warning: no previous prototype for 'arm_smccc_em_dt_alloc_tbl_entry' [-Wmissing-prototypes]
>      142 | int arm_smccc_em_dt_alloc_tbl_entry(struct device_node *np, const char *name,
>          |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

It's just missing a static. Fixed locally.


Thanks,

James
