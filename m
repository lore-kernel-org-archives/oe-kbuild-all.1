Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A7E10785
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Sep 2023 12:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694781418; x=1726317418;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jsE+etrWcKrreSh7EmXin+Y6S9JHqoOsE49jSlUMh3g=;
  b=ged9+pEQP0B8hPzYUHgpJYzAxcnZtIa+iuETX9OBAzwbqH8fIDerIRFC
   7HH9XzSwhfJrsOMGLLAqnvwKeWnw9ZnhX633D9t7bP9PZHaj0VEG23Tyb
   M6guNprTZkncNg3xu01cAw/N4RhX1Agba0ONUStBiIHsBsRRRkNug/av6
   zKcgTJwblKtYaU71MLP//eGStcOlVm3+/qeKGZl496X/6wSqxDIp9vk4N
   v0gkdrSChwqzEt7CnDaunkSfoy1w7rOwRLMt/7pJTdQaO1JuRRqKijj0i
   E1IlDfqaIul8TDOvcBts06i9RqlM2raw9IHUQU3+hvUZm6bXNaRjrCMUD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="369554875"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="369554875"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 05:36:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="1075781420"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="1075781420"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 15 Sep 2023 05:36:55 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qh845-0002yH-18;
	Fri, 15 Sep 2023 12:36:53 +0000
Date: Fri, 15 Sep 2023 20:35:53 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] KVM: x86: Add KVM_VCPU_TSC_SCALE and fix the documentation
 on TSC migration
Message-ID: <202309152031.jsguXJKB-lkp@intel.com>
References: <13f256ad95de186e3b6bcfcc1f88da5d0ad0cb71.camel@infradead.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13f256ad95de186e3b6bcfcc1f88da5d0ad0cb71.camel@infradead.org>

Hi David,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on kvm/queue]
[also build test WARNING on mst-vhost/linux-next linus/master v6.6-rc1 next-20230915]
[cannot apply to kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Woodhouse/KVM-x86-Add-KVM_VCPU_TSC_SCALE-and-fix-the-documentation-on-TSC-migration/20230913-221946
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/13f256ad95de186e3b6bcfcc1f88da5d0ad0cb71.camel%40infradead.org
patch subject: [RFC] KVM: x86: Add KVM_VCPU_TSC_SCALE and fix the documentation on TSC migration
reproduce: (https://download.01.org/0day-ci/archive/20230915/202309152031.jsguXJKB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309152031.jsguXJKB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/virt/kvm/devices/vcpu.rst:223: WARNING: Unexpected indentation.
>> Documentation/virt/kvm/devices/vcpu.rst:224: WARNING: Block quote ends without a blank line; unexpected unindent.
>> Documentation/virt/kvm/devices/vcpu.rst:304: WARNING: Definition list ends without a blank line; unexpected unindent.

vim +223 Documentation/virt/kvm/devices/vcpu.rst

   218	
   219	  guest_tsc = (( host_tsc * tsc_scale_ratio ) >> tsc_scale_bits ) + KVM_VCPU_TSC_OFFSET
   220	
   221	The value of tsc_scale_bits is 48 on Intel and 32 on AMD. You can calculate
   222	tsc_scale_ratio as (... where you might be able to botain tsc_scale_bits from debugfs
 > 223	  if you're luckyThis attribute is useful to adjust the guest's TSC on live migration,
 > 224	so that the TSC counts the time during which the VM was paused. The
   225	following describes a possible algorithm to use for this purpose.
   226	
   227	From the source VMM process:
   228	
   229	1. Invoke the KVM_GET_CLOCK ioctl to record the host TSC (tsc_src),
   230	   kvmclock nanoseconds (guest_src), and host CLOCK_REALTIME nanoseconds
   231	   (host_src).
   232	
   233	2. Read the KVM_VCPU_TSC_OFFSET attribute for every vCPU to record the
   234	   guest TSC offset (ofs_src[i]).
   235	
   236	3. Invoke the KVM_GET_TSC_KHZ ioctl to record the frequency of the
   237	   guest's TSC (freq).
   238	
   239	4. Read the KVM_VCPU_TSC_SCALE attribute for each vCPU to obtain the
   240	   src_tsc_ratio[i] and src_tsc_frac_bits[i] values.
   241	
   242	5. For each vCPU[i], calculate the guest TSC value (guest_tsc_src) at time
   243	   [guest_src] in guest KVM time. This is calculated by the formula:
   244	      guest_tsc_src[i] = ((tsc_src * src_tsc_ratio[i]) >> src_tsc_frac_bits[i]) + ofs_src[i]
   245	
   246	From the destination VMM process:
   247	
   248	6. Invoke the KVM_SET_TSC_KHZ ioctl to set the scaled frequency of the
   249	   guest's TSC (freq).
   250	
   251	7. Invoke the KVM_SET_CLOCK ioctl, providing the source nanoseconds from
   252	   kvmclock (guest_src) and CLOCK_REALTIME (host_src) in their respective
   253	   fields.  Ensure that the KVM_CLOCK_REALTIME flag is set in the provided
   254	   structure.
   255	
   256	   KVM will advance the VM's kvmclock to account for elapsed time since
   257	   recording the clock values.  Note that this will cause problems in
   258	   the guest (e.g., timeouts) unless CLOCK_REALTIME is synchronized
   259	   between the source and destination, and a reasonably short time passes
   260	   between the source pausing the VMs and the destination executing
   261	   steps 4-7.
   262	
   263	8. Invoke the KVM_GET_CLOCK ioctl to record the host TSC (tsc_dest) and
   264	   kvmclock nanoseconds (guest_dest).
   265	
   266	9. Read the KVM_VCPU_TSC_SCALE attribute for each vCPU to obtain the
   267	   dest_tsc_ratio[i] and dest_tsc_frac_bits[i] values.
   268	
   269	10. For each vCPU[i], calculate the guest TSC value (guest_src_dest) at time
   270	    [guest_dest] in guest KVM time, as follows:
   271	       guest_tsc_dest[i] = guest_tsc_src[i] + (guest_dest - guest_src) / (1000000 * freq)
   272	
   273	11. For each vcpu[i], calculate what KVM will use internally as the scaled
   274	    guest time _before_ offsetting at time [guest_dest]:
   275	       raw_guest_tsc_dest[i] = (tsc_dest * dest_tsc_ratio[i]) >> dest_tsc_frac_bits[i]
   276	
   277	12. Calculate the post-scaling guest TSC offsets for every vCPU to account
   278	    for the difference between the raw scaled value and the intended value:
   279	
   280	       ofs_dst[i] = guest_tsc_dest[i] - raw_guest_tsc_dest[i]
   281	
   282	13. Write the KVM_VCPU_TSC_OFFSET attribute for every vCPU with the
   283	    respective value derived in the previous step.
   284	
   285	4.2 ATTRIBUTE: KVM_VCPU_TSC_SCALE
   286	
   287	:Parameters: 64-bit fixed point TSC scale factor
   288	
   289	Returns:
   290	
   291		 ======= ======================================
   292		 -EFAULT Error reading the provided parameter
   293			 address.
   294		 -ENXIO  Attribute not supported
   295		 -EINVAL Invalid request to write the attribute
   296		 ======= ======================================
   297	
   298	This read-only attribute reports the guest's TSC scaling factor, in the form
   299	of a fixed-point number represented by the following structure:
   300	
   301	    struct kvm_vcpu_tsc_scale {
   302		    __u64	tsc_ratio;
   303		    __u64	tsc_frac_bits;
 > 304	    };
   305	
   306	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
