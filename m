Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E43C21856
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Nov 2022 10:45:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 453481FB;
	Tue, 22 Nov 2022 02:45:33 -0800 (PST)
Received: from [10.57.37.38] (unknown [10.57.37.38])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB55B3F587;
	Tue, 22 Nov 2022 02:45:25 -0800 (PST)
Message-ID: <a1f4b820-260d-69df-0d1f-5252778c3ebe@arm.com>
Date: Tue, 22 Nov 2022 10:45:24 +0000
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [linux-next:master 7077/9540]
 drivers/perf/arm_cspmu/arm_cspmu.c:1105:29: error: implicit declaration of
 function 'get_acpi_id_for_cpu'
To: Will Deacon <will@kernel.org>, kernel test robot <lkp@intel.com>
Cc: Besar Wicaksono <bwicaksono@nvidia.com>, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202211221747.6AuvQi8G-lkp@intel.com>
 <20221122102839.GA19640@willie-the-truck>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20221122102839.GA19640@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/11/2022 10:28, Will Deacon wrote:
> On Tue, Nov 22, 2022 at 05:27:38PM +0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   771a207d1ee9f38da8c0cee1412228f18b900bac
>> commit: e37dfd65731dc4f001fa7dfa7f705e6840017d5a [7077/9540] perf: arm_cspmu: Add support for ARM CoreSight PMU driver
>> config: loongarch-allmodconfig
>> compiler: loongarch64-linux-gcc (GCC) 12.1.0
>> reproduce (this is a W=1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=e37dfd65731dc4f001fa7dfa7f705e6840017d5a
>>          git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>>          git fetch --no-tags linux-next master
>>          git checkout e37dfd65731dc4f001fa7dfa7f705e6840017d5a
>>          # save the config file
>>          mkdir build_dir && cp config build_dir/.config
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/iio/magnetometer/ drivers/perf/arm_cspmu/
>>
>> If you fix the issue, kindly add following tag where applicable
>> | Reported-by: kernel test robot <lkp@intel.com>
>>
>> Note: the linux-next/master HEAD 771a207d1ee9f38da8c0cee1412228f18b900bac builds fine.
>>        It may have been fixed somewhere.
>>
>> All errors (new ones prefixed by >>):
>>
>>     drivers/perf/arm_cspmu/arm_cspmu.c: In function 'arm_cspmu_get_cpus':
>>>> drivers/perf/arm_cspmu/arm_cspmu.c:1105:29: error: implicit declaration of function 'get_acpi_id_for_cpu' [-Werror=implicit-function-declaration]
>>      1105 |                             get_acpi_id_for_cpu(cpu)) {
>>           |                             ^~~~~~~~~~~~~~~~~~~
>>     cc1: some warnings being treated as errors
> 
> Besar, Suzuki, please can you look into this?

This was fixed with a Kconfig depenedency on ARM64 [0]. The above commit 
picked up doesn't have the fix. i.e., this is a duplicate error report.

[0] https://git.kernel.org/will/c/e72dbf9085b5

Thanks
Suzuki

