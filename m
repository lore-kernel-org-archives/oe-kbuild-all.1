Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898023;
	b=n6r0cU+NuWyndqOaaeIQTDQzLycfizhqAEO0ZxQfkRU6C+wo2WJUxW0oZHJoJGxSM4n+
	 u+QuwwUjPP5AKEo7KSPQUDxNeVRmU1wM41uT3p0j3Dbk8WWNs2Y8K4oRdbPKx+kO/3pfE
	 eDqFid6A6+vXK9ppHnwC92Hih317mTF9UIQ6C9JMipWSvX0Jm5Wa2PjLkrHD3lehz0NUW
	 QiMyfLfPVzoCcBM4cMX4pBBnLgWq1vs7xaxXG/NV7ZCvJ2iLdxcW+35zB6Ih333BsdZZj
	 fheyO4IwyrLbb8lqPKGFSdGiFD6w7oGVvZ+/ZNt5+BUi3qLSvTejCeSuQeAzNFuorsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898023;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=aUn1p0bkBdhHEWFvpyQ5EurZf62YrCB8HnfQ3TYbAUU=;
	b=AewGlUgjybsfe83mZGEOsc36cRoqOcXxzbjy2l9o25jKy/t1umv3YzDpL2dbaoRG+Y6S
	 dHFWNPeIkZSNVoS0EuRvBOH+NlzfbYRK1NxHJkuOMKYsr/iKLKtEDbRyhA1dnS2LeLtam
	 juAKHKEHRPxQeumpOhzzPn5HXkYRPQu6UOdlSrjti2t78nP+Qyi5r2Y6XUmoFOf2VAv0t
	 fHnCfxhuZlA76piWZ/UVIBKyk8idKW0e7L2yqMSc+MBTa6JH6fMI9hib8lXUNy6od1Hm/
	 TeV0o3oLdMe/jK7Xu7cB20Km7jOWXJNNm4X0+n1e3WOELEMpyd6I09nKebwz/7X+A7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RlJz19BV;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1620B606A31E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Oct 2026 03:13:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1620B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RlJz19BV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792898021; x=1824434021;
  h=date:from:to:cc:subject:message-id;
  bh=AurJ3R8o/m8Umt0VSdpCQUArjSxVTPrL8MhrFP2v+Ak=;
  b=RlJz19BVuvTwy5q6sTmoIpVBrhsaOZ4KgMY30sSvQSIor2VWk5eV/Onv
   avk5AqOt3qoAM27m1Gygq7KhD1EeoWxkqTeHW3dIOhO+23Lv37VbbGhUl
   PwO2gSGmw43GAa1iih48HtS1vNhNwFc797uZdzTz1sPfijWVl0mGr+sc5
   a85OhvwpvbsiWMMXJQV4feLUWvEWcpD1DgiH0ZF0icrH7oLBpaIHmIt4+
   PcxFSV+nNwLVq+EWq49r8ZMc6zwlXdGhj48YkmOr4SsuzUk+pKNMEP/r2
   hD2bG1hPEoozOHQPTt6SDo5eWqI2d52L5/mAmUWMVoBP0cdqWujY74E7f
   w==;
X-CSE-ConnectionGUID: 75LwJ6NqRaq/X6p51HDNrA==
X-CSE-MsgGUID: aIgU7Gh2TZaENbEbmrL2Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11945"; a="1613502"
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="1613502"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 20:13:41 -0700
X-CSE-ConnectionGUID: utw5Gg3ERjSBfJebcVZslQ==
X-CSE-MsgGUID: ZvPaMQK2TjCGTFO29ok48Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="4089735"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 24 Oct 2026 20:13:39 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKofw-000000003ax-3FPF;
	Sun, 25 Oct 2026 03:13:36 +0000
Date: Sun, 25 Oct 2026 04:12:43 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1]
 drivers/acpi/acpica/utresrc.c:182:8: warning: performing pointer subtraction
 with a null pointer has undefined behavior
Message-ID: <202610250418.w92EI0hx-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   28463dff2a7af2a53f4a3243fa7a56494bde42ce
commit: 816badec122fe01d05265f2d306212739f5d3fdb [1/1] ACPICA: Enhance buffer validation in acpi_ut_walk_aml_resources()
config: i386-randconfig-2101-20261024 (https://download.01.org/0day-ci/archive/20261025/202610250418.w92EI0hx-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project a808f8ea7fdc61ead417bfe55e8ef5f728776aeb)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261025/202610250418.w92EI0hx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610250418.w92EI0hx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   clang: warning: optimization flag '-falign-jumps=0' is not supported [-Wignored-optimization-argument]
   In file included from drivers/acpi/acpica/utresrc.c:8:
   In file included from include/acpi/acpi.h:22:
   In file included from include/acpi/platform/acenv.h:163:
   In file included from include/acpi/platform/aclinux.h:55:
   In file included from include/linux/sched.h:14:
   In file included from include/linux/pid.h:5:
   In file included from include/linux/rculist.h:11:
   In file included from include/linux/rcupdate.h:27:
   In file included from include/linux/preempt.h:79:
   In file included from arch/x86/include/asm/preempt.h:7:
   In file included from include/linux/thread_info.h:39:
   arch/x86/include/asm/thread_info.h:185:13: warning: calling '__builtin_frame_address' with a nonzero argument is unsafe [-Wframe-address]
     185 |         oldframe = __builtin_frame_address(1);
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/thread_info.h:187:11: warning: calling '__builtin_frame_address' with a nonzero argument is unsafe [-Wframe-address]
     187 |                 frame = __builtin_frame_address(2);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/acpi/acpica/utresrc.c:8:
   In file included from include/acpi/acpi.h:22:
   In file included from include/acpi/platform/acenv.h:163:
   In file included from include/acpi/platform/aclinux.h:58:
   In file included from include/linux/slab.h:15:
   In file included from include/linux/gfp.h:6:
   include/linux/mmzone.h:1136:6: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
    1136 |         int nid;
         |             ^
>> drivers/acpi/acpica/utresrc.c:182:8: warning: performing pointer subtraction with a null pointer has undefined behavior [-Wnull-pointer-subtraction]
     182 |                      ACPI_OFFSET(struct aml_resource_common_serialbus,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     183 |                                  type) + 1)) {
         |                                  ~~~~~
   include/acpi/actypes.h:511:41: note: expanded from macro 'ACPI_OFFSET'
     511 | #define ACPI_OFFSET(d, f)               ACPI_PTR_DIFF (&(((d *) 0)->f), (void *) 0)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/acpi/actypes.h:505:79: note: expanded from macro 'ACPI_PTR_DIFF'
     505 | #define ACPI_PTR_DIFF(a, b)             ((acpi_size) (ACPI_CAST_PTR (u8, (a)) - ACPI_CAST_PTR (u8, (b))))
         |                                                                               ^ ~~~~~~~~~~~~~~~~~~~~~~~
   4 warnings generated.


vim +182 drivers/acpi/acpica/utresrc.c

   117	
   118	/*******************************************************************************
   119	 *
   120	 * FUNCTION:    acpi_ut_walk_aml_resources
   121	 *
   122	 * PARAMETERS:  walk_state          - Current walk info
   123	 * PARAMETERS:  aml                 - Pointer to the raw AML resource template
   124	 *              aml_length          - Length of the entire template
   125	 *              user_function       - Called once for each descriptor found. If
   126	 *                                    NULL, a pointer to the end_tag is returned
   127	 *              context             - Passed to user_function
   128	 *
   129	 * RETURN:      Status
   130	 *
   131	 * DESCRIPTION: Walk a raw AML resource list(buffer). User function called
   132	 *              once for each resource found.
   133	 *
   134	 ******************************************************************************/
   135	
   136	acpi_status
   137	acpi_ut_walk_aml_resources(struct acpi_walk_state *walk_state,
   138				   u8 *aml,
   139				   acpi_size aml_length,
   140				   acpi_walk_aml_callback user_function, void **context)
   141	{
   142		acpi_status status;
   143		u8 *end_aml;
   144		u8 resource_index;
   145		u32 length;
   146		u32 offset = 0;
   147		u8 end_tag[2] = { 0x79, 0x00 };
   148	
   149		ACPI_FUNCTION_TRACE(ut_walk_aml_resources);
   150	
   151		/* The absolute minimum resource template is one end_tag descriptor */
   152	
   153		if (aml_length < sizeof(struct aml_resource_end_tag)) {
   154			return_ACPI_STATUS(AE_AML_NO_RESOURCE_END_TAG);
   155		}
   156	
   157		/* Point to the end of the resource template buffer */
   158	
   159		end_aml = aml + aml_length;
   160	
   161		/* Walk the byte list, abort on any invalid descriptor type or length */
   162	
   163		while (aml < end_aml) {
   164			/*
   165			 * Validate that the remaining buffer space can hold enough
   166			 * bytes to safely access fields during validation.
   167			 * For large resource descriptors (bit 7 set), we need enough
   168			 * bytes to access the Type field in serial_bus resources.
   169			 * Small resource descriptors only need sizeof(struct aml_resource_end_tag).
   170			 */
   171			if ((acpi_size)(end_aml - aml) <
   172			    sizeof(struct aml_resource_end_tag)) {
   173				return_ACPI_STATUS(AE_AML_BUFFER_LENGTH);
   174			}
   175	
   176			/*
   177			 * For large resource descriptors, ensure enough space for
   178			 * the header plus serial_bus Type field access.
   179			 */
   180			if ((ACPI_GET8(aml) & ACPI_RESOURCE_NAME_LARGE) &&
   181			    ((acpi_size)(end_aml - aml) <
 > 182			     ACPI_OFFSET(struct aml_resource_common_serialbus,
   183					 type) + 1)) {
   184				return_ACPI_STATUS(AE_AML_BUFFER_LENGTH);
   185			}
   186	
   187			/* Validate the Resource Type and Resource Length */
   188	
   189			status =
   190			    acpi_ut_validate_resource(walk_state, aml, &resource_index);
   191			if (ACPI_FAILURE(status)) {
   192				/*
   193				 * Exit on failure. Cannot continue because the descriptor
   194				 * length may be bogus also.
   195				 */
   196				return_ACPI_STATUS(status);
   197			}
   198	
   199			/* Get the length of this descriptor */
   200	
   201			length = acpi_ut_get_descriptor_length(aml);
   202	
   203			/*
   204			 * Validate that the descriptor length doesn't exceed the
   205			 * remaining buffer size to prevent reading beyond the end.
   206			 */
   207			if (length > (acpi_size)(end_aml - aml)) {
   208				return_ACPI_STATUS(AE_AML_BUFFER_LENGTH);
   209			}
   210	
   211			/* Invoke the user function */
   212	
   213			if (user_function) {
   214				status =
   215				    user_function(aml, length, offset, resource_index,
   216						  context);
   217				if (ACPI_FAILURE(status)) {
   218					return_ACPI_STATUS(status);
   219				}
   220			}
   221	
   222			/* An end_tag descriptor terminates this resource template */
   223	
   224			if (acpi_ut_get_resource_type(aml) ==
   225			    ACPI_RESOURCE_NAME_END_TAG) {
   226				/*
   227				 * There must be at least one more byte in the buffer for
   228				 * the 2nd byte of the end_tag
   229				 */
   230				if ((aml + 1) >= end_aml) {
   231					return_ACPI_STATUS(AE_AML_NO_RESOURCE_END_TAG);
   232				}
   233	
   234				/*
   235				 * Don't attempt to perform any validation on the 2nd byte.
   236				 * Although all known ASL compilers insert a zero for the 2nd
   237				 * byte, it can also be a checksum (as per the ACPI spec),
   238				 * and this is occasionally seen in the field. July 2017.
   239				 */
   240	
   241				/* Return the pointer to the end_tag if requested */
   242	
   243				if (!user_function) {
   244					*context = aml;
   245				}
   246	
   247				/* Normal exit */
   248	
   249				return_ACPI_STATUS(AE_OK);
   250			}
   251	
   252			aml += length;
   253			offset += length;
   254		}
   255	
   256		/* Did not find an end_tag descriptor */
   257	
   258		if (user_function) {
   259	
   260			/* Insert an end_tag anyway. acpi_rs_get_list_length always leaves room */
   261	
   262			(void)acpi_ut_validate_resource(walk_state, end_tag,
   263							&resource_index);
   264			status =
   265			    user_function(end_tag, 2, offset, resource_index, context);
   266			if (ACPI_FAILURE(status)) {
   267				return_ACPI_STATUS(status);
   268			}
   269		}
   270	
   271		return_ACPI_STATUS(AE_AML_NO_RESOURCE_END_TAG);
   272	}
   273	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
