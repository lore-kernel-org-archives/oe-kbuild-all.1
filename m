Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E0E176ADA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 05:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727414961; cv=none; b=hO07KLHu7VTIgGBsJccn6TEKBtFskg96Ga69tpkB+ug2RnR2q8ksUh/kgtPs4LojQFiWtlmg+LYGDtLThnSFTShHvXT7HSUzSJB1FQAXtu62TokJlMu/0apzS1C0b7+Q7D1C5ho826JqVfdUoqtrbjSp5eP1HkX4SKVn1NRcH/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727414961; c=relaxed/simple;
	bh=fq1U3yVpz4rgVQoSshWU7nsweAa8bZYPRrpVfe/7Bpw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=We76xbrWsnHRbdut2ig9aTWgD7AXx6JWFW5y/NuCdNn4+/5MSApx8p+bhBbtPIiduUls0Y8D6RceJEsZgfr7OMjbSK/P1d/ABkLlfdlp7xVqChKJqPbQYcscgnPbva32RVbmKVdCBE+gRLwRG4DMWNOhoCSaaCIKG42wakX8R40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E25T8ErQ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E25T8ErQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727414959; x=1758950959;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fq1U3yVpz4rgVQoSshWU7nsweAa8bZYPRrpVfe/7Bpw=;
  b=E25T8ErQ2BxcgVBrsYbrvEDFpVfqycW/nbkYDIptwoL63Jnbi61k3hC8
   KHYLziv/D70PEVc/gauAaqfHD80FYBZ9JNbROkVtweyS/fx7TrZnaNLn7
   XGRRojKcwPfYI0BGOsktM3NJSyg+3bB8xS+d0+qaIXZ4b6YklYXPYkqs2
   c6ou7Y4ZwxncyP7s7ztSY+9h1lNnu3QPMArP+on5HtwT6Dc7CeGiHAd+6
   oq64HaxiImetWteen2OY3bPGvpBkDeKW8HHk1FoNEYocnEW8ozu8FqnlW
   tvz8mOkcPeSggGDLWvSLq1vA10pdOpEyR0kYu3U0HGCd6Z6Wztg0GiYPq
   w==;
X-CSE-ConnectionGUID: 4WHHOkadRdy3CTv2q/muUw==
X-CSE-MsgGUID: IU4aZHLaTvGGbi185WfZRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37114314"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="37114314"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 22:29:18 -0700
X-CSE-ConnectionGUID: pUEAb+z0ROyy08/skBniiw==
X-CSE-MsgGUID: cDVHVZ3KTjqeg7R4IQB1IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="72714907"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 26 Sep 2024 22:28:58 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su3XC-000LW5-2W;
	Fri, 27 Sep 2024 05:28:54 +0000
Date: Fri, 27 Sep 2024 13:28:45 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ma Wupeng <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 11427/14193] loongarch64-linux-ld:
 rpm-traces.c:undefined reference to `__trace_trigger_soft_disabled'
Message-ID: <202409271347.SHAKNDVo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   515984f18a6f359887b37e95ef5a785b04ae2da7
commit: d14435b8c5cdcdadede980b086f439a7d6747d0c [11427/14193] LoongArch: F=
ix callchain parse error with kernel tracepoint events again
config: loongarch-randconfig-002-20240925 (https://download.01.org/0day-ci/=
archive/20240927/202409271347.SHAKNDVo-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240927/202409271347.SHAKNDVo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409271347.SHAKNDVo-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `.L572':
   power-traces.c:(.text+0x359c): undefined reference to `trace_event_print=
f'
   loongarch64-linux-ld: power-traces.c:(.text+0x35c0): undefined reference=
 to `trace_handle_return'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `.L580':
   power-traces.c:(.text+0x3678): undefined reference to `trace_print_symbo=
ls_seq'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `.L581':
   power-traces.c:(.text+0x36ac): undefined reference to `trace_output_call'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `.L587':
   power-traces.c:(.text+0x3788): undefined reference to `perf_trace_buf_al=
loc'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `trace_ra=
w_output_pm_qos_update':
   power-traces.c:(.text+0x37dc): undefined reference to `perf_trace_run_bp=
f_submit'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `.L10001=
=021':
   power-traces.c:(.text+0x39d8): undefined reference to `trace_event_buffe=
r_reserve'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `.L606':
   power-traces.c:(.text+0x3a3c): undefined reference to `trace_event_buffe=
r_commit'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `perf_tra=
ce_wakeup_source':
   power-traces.c:(.text+0x3ae8): undefined reference to `__trace_trigger_s=
oft_disabled'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `.L615':
   power-traces.c:(.text+0x3b84): undefined reference to `perf_trace_buf_al=
loc'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `.L613':
   power-traces.c:(.text+0x3c0c): undefined reference to `perf_trace_run_bp=
f_submit'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `.L638':
   power-traces.c:(.text+0x3f10): undefined reference to `trace_event_buffe=
r_reserve'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `.L654':
   power-traces.c:(.text+0x3fcc): undefined reference to `trace_event_buffe=
r_commit'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `.L659':
   power-traces.c:(.text+0x40a8): undefined reference to `__trace_trigger_s=
oft_disabled'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `.L667':
   power-traces.c:(.text+0x414c): undefined reference to `perf_trace_buf_al=
loc'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `.L678':
   power-traces.c:(.text+0x4230): undefined reference to `perf_trace_run_bp=
f_submit'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `.L697':
   power-traces.c:(.text+0x43f4): undefined reference to `trace_event_buffe=
r_reserve'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `.L690':
   power-traces.c:(.text+0x4420): undefined reference to `trace_event_buffe=
r_commit'
   loongarch64-linux-ld: power-traces.c:(.text+0x4474): undefined reference=
 to `trace_event_buffer_reserve'
   loongarch64-linux-ld: kernel/trace/power-traces.o: in function `.L708':
   power-traces.c:(.text+0x44c8): undefined reference to `__trace_trigger_s=
oft_disabled'
   loongarch64-linux-ld: kernel/trace/power-traces.o:(.ref.data+0x18): unde=
fined reference to `trace_event_reg'
   loongarch64-linux-ld: kernel/trace/power-traces.o:(.ref.data+0x40): unde=
fined reference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/trace/power-traces.o:(.ref.data+0x60): unde=
fined reference to `trace_event_reg'
   loongarch64-linux-ld: kernel/trace/power-traces.o:(.ref.data+0x88): unde=
fined reference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/trace/power-traces.o:(.ref.data+0xa8): unde=
fined reference to `trace_event_reg'
   loongarch64-linux-ld: kernel/trace/power-traces.o:(.ref.data+0xd0): unde=
fined reference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/trace/power-traces.o:(.ref.data+0xf0): unde=
fined reference to `trace_event_reg'
   loongarch64-linux-ld: kernel/trace/power-traces.o:(.ref.data+0x118): und=
efined reference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/trace/power-traces.o:(.ref.data+0x138): und=
efined reference to `trace_event_reg'
   loongarch64-linux-ld: kernel/trace/power-traces.o:(.ref.data+0x160): und=
efined reference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/trace/power-traces.o:(.ref.data+0x180): und=
efined reference to `trace_event_reg'
   loongarch64-linux-ld: kernel/trace/power-traces.o:(.ref.data+0x1a8): und=
efined reference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/trace/power-traces.o:(.ref.data+0x1c8): und=
efined reference to `trace_event_reg'
   loongarch64-linux-ld: kernel/trace/power-traces.o:(.ref.data+0x1f0): und=
efined reference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/trace/power-traces.o:(.ref.data+0x210): und=
efined reference to `trace_event_reg'
   loongarch64-linux-ld: kernel/trace/power-traces.o:(.ref.data+0x238): und=
efined reference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/trace/power-traces.o:(.ref.data+0x258): und=
efined reference to `trace_event_reg'
   loongarch64-linux-ld: kernel/trace/power-traces.o:(.ref.data+0x280): und=
efined reference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/trace/power-traces.o:(.ref.data+0x2a0): und=
efined reference to `trace_event_reg'
   loongarch64-linux-ld: kernel/trace/power-traces.o:(.ref.data+0x2c8): und=
efined reference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/trace/power-traces.o:(.ref.data+0x2e8): und=
efined reference to `trace_event_reg'
   loongarch64-linux-ld: kernel/trace/power-traces.o:(.ref.data+0x310): und=
efined reference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/trace/power-traces.o:(.ref.data+0x330): und=
efined reference to `trace_event_reg'
   loongarch64-linux-ld: kernel/trace/power-traces.o:(.ref.data+0x358): und=
efined reference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/trace/power-traces.o:(.ref.data+0x378): und=
efined reference to `trace_event_reg'
   loongarch64-linux-ld: kernel/trace/power-traces.o:(.ref.data+0x3a0): und=
efined reference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/trace/power-traces.o:(.ref.data+0x3c0): und=
efined reference to `trace_event_reg'
   loongarch64-linux-ld: kernel/trace/power-traces.o:(.ref.data+0x3e8): und=
efined reference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/trace/power-traces.o:(.ref.data+0x408): und=
efined reference to `trace_event_reg'
   loongarch64-linux-ld: kernel/trace/power-traces.o:(.ref.data+0x430): und=
efined reference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/trace/rpm-traces.o: in function `trace_raw_=
output_rpm_internal':
   rpm-traces.c:(.text+0x2a4): undefined reference to `trace_raw_output_pre=
p'
   loongarch64-linux-ld: kernel/trace/rpm-traces.o: in function `.L49':
   rpm-traces.c:(.text+0x338): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: rpm-traces.c:(.text+0x358): undefined reference to=
 `trace_handle_return'
   loongarch64-linux-ld: kernel/trace/rpm-traces.o: in function `trace_raw_=
output_rpm_return_int':
   rpm-traces.c:(.text+0x384): undefined reference to `trace_raw_output_pre=
p'
   loongarch64-linux-ld: rpm-traces.c:(.text+0x3dc): undefined reference to=
 `trace_event_printf'
   loongarch64-linux-ld: kernel/trace/rpm-traces.o: in function `.L55':
   rpm-traces.c:(.text+0x3fc): undefined reference to `trace_handle_return'
   loongarch64-linux-ld: kernel/trace/rpm-traces.o: in function `.L59':
   rpm-traces.c:(.text+0x4bc): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/trace/rpm-traces.o: in function `.L62':
   rpm-traces.c:(.text+0x514): undefined reference to `perf_trace_run_bpf_s=
ubmit'
   loongarch64-linux-ld: kernel/trace/rpm-traces.o: in function `perf_trace=
_rpm_internal':
   rpm-traces.c:(.text+0x694): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/trace/rpm-traces.o: in function `.L83':
   rpm-traces.c:(.text+0x734): undefined reference to `perf_trace_run_bpf_s=
ubmit'
   loongarch64-linux-ld: kernel/trace/rpm-traces.o: in function `.L96':
   rpm-traces.c:(.text+0x8a4): undefined reference to `trace_event_buffer_r=
eserve'
   loongarch64-linux-ld: kernel/trace/rpm-traces.o: in function `trace_even=
t_raw_event_rpm_return_int':
   rpm-traces.c:(.text+0x8d4): undefined reference to `trace_event_buffer_c=
ommit'
   loongarch64-linux-ld: kernel/trace/rpm-traces.o: in function `.L118':
   rpm-traces.c:(.text+0x95c): undefined reference to `trace_event_buffer_r=
eserve'
   loongarch64-linux-ld: kernel/trace/rpm-traces.o: in function `.L101':
   rpm-traces.c:(.text+0x9c8): undefined reference to `__trace_trigger_soft=
_disabled'
   loongarch64-linux-ld: kernel/trace/rpm-traces.o: in function `.L117':
   rpm-traces.c:(.text+0xa5c): undefined reference to `trace_event_buffer_r=
eserve'
   loongarch64-linux-ld: kernel/trace/rpm-traces.o: in function `trace_even=
t_raw_event_rpm_internal':
   rpm-traces.c:(.text+0xad4): undefined reference to `trace_event_buffer_c=
ommit'
   loongarch64-linux-ld: kernel/trace/rpm-traces.o: in function `.L130':
   rpm-traces.c:(.text+0xb5c): undefined reference to `trace_event_buffer_r=
eserve'
>> loongarch64-linux-ld: rpm-traces.c:(.text+0xba8): undefined reference to=
 `__trace_trigger_soft_disabled'
   loongarch64-linux-ld: kernel/trace/rpm-traces.o:(.ref.data+0x18): undefi=
ned reference to `trace_event_reg'
   loongarch64-linux-ld: kernel/trace/rpm-traces.o:(.ref.data+0x40): undefi=
ned reference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/trace/rpm-traces.o:(.ref.data+0x60): undefi=
ned reference to `trace_event_reg'
   loongarch64-linux-ld: kernel/trace/rpm-traces.o:(.ref.data+0x88): undefi=
ned reference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/rseq.o: in function `perf_trace_rseq_update=
':
   rseq.c:(.text+0x3d4): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/rseq.o: in function `.L34':
   rseq.c:(.text+0x430): undefined reference to `perf_trace_run_bpf_submit'
   loongarch64-linux-ld: kernel/rseq.o: in function `perf_trace_rseq_ip_fix=
up':
   rseq.c:(.text+0x52c): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/rseq.o: in function `.L46':
   rseq.c:(.text+0x568): undefined reference to `perf_trace_run_bpf_submit'
   loongarch64-linux-ld: kernel/rseq.o: in function `trace_event_raw_event_=
rseq_update':
   rseq.c:(.text+0x650): undefined reference to `trace_event_buffer_reserve'
   loongarch64-linux-ld: kernel/rseq.o: in function `.L61':
   rseq.c:(.text+0x690): undefined reference to `trace_event_buffer_commit'
   loongarch64-linux-ld: kernel/rseq.o: in function `.L57':
   rseq.c:(.text+0x6e8): undefined reference to `__trace_trigger_soft_disab=
led'
   loongarch64-linux-ld: kernel/rseq.o: in function `trace_event_raw_event_=
rseq_ip_fixup':
   rseq.c:(.text+0x770): undefined reference to `trace_event_buffer_reserve'
   loongarch64-linux-ld: rseq.c:(.text+0x78c): undefined reference to `trac=
e_event_buffer_commit'
   loongarch64-linux-ld: kernel/rseq.o: in function `.L68':
   rseq.c:(.text+0x7e8): undefined reference to `__trace_trigger_soft_disab=
led'
   loongarch64-linux-ld: rseq.c:(.text+0x81c): undefined reference to `trac=
e_raw_output_prep'
   loongarch64-linux-ld: kernel/rseq.o: in function `trace_raw_output_rseq_=
update':
   rseq.c:(.text+0x878): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: rseq.c:(.text+0x898): undefined reference to `trac=
e_handle_return'
   loongarch64-linux-ld: kernel/rseq.o: in function `.L84':
   rseq.c:(.text+0x8c4): undefined reference to `trace_raw_output_prep'
   loongarch64-linux-ld: kernel/rseq.o: in function `trace_raw_output_rseq_=
ip_fixup':
   rseq.c:(.text+0x91c): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: rseq.c:(.text+0x93c): undefined reference to `trac=
e_handle_return'
   loongarch64-linux-ld: kernel/rseq.o:(.ref.data+0x18): undefined referenc=
e to `trace_event_reg'
   loongarch64-linux-ld: kernel/rseq.o:(.ref.data+0x40): undefined referenc=
e to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/rseq.o:(.ref.data+0x60): undefined referenc=
e to `trace_event_reg'
   loongarch64-linux-ld: kernel/rseq.o:(.ref.data+0x88): undefined referenc=
e to `trace_event_raw_init'
   loongarch64-linux-ld: mm/filemap.o: in function `perf_trace_mm_filemap_o=
p_page_cache':
   filemap.c:(.text+0x2ac): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: mm/filemap.o: in function `.L54':
   filemap.c:(.text+0x390): undefined reference to `perf_trace_run_bpf_subm=
it'
   loongarch64-linux-ld: mm/filemap.o: in function `perf_trace_filemap_set_=
wb_err':
   filemap.c:(.text+0x494): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: mm/filemap.o: in function `.L68':
   filemap.c:(.text+0x4e4): undefined reference to `perf_trace_run_bpf_subm=
it'
   loongarch64-linux-ld: mm/filemap.o: in function `perf_trace_file_check_a=
nd_advance_wb_err':
   filemap.c:(.text+0x5d4): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: mm/filemap.o: in function `.L82':
   filemap.c:(.text+0x638): undefined reference to `perf_trace_run_bpf_subm=
it'
   loongarch64-linux-ld: mm/filemap.o: in function `.L94':
   filemap.c:(.text+0x720): undefined reference to `trace_event_buffer_rese=
rve'
   loongarch64-linux-ld: mm/filemap.o: in function `.L99':
   filemap.c:(.text+0x7e4): undefined reference to `trace_event_buffer_comm=
it'
   loongarch64-linux-ld: mm/filemap.o: in function `.L95':
   filemap.c:(.text+0x86c): undefined reference to `__trace_trigger_soft_di=
sabled'
   loongarch64-linux-ld: mm/filemap.o: in function `.L96':
   filemap.c:(.text+0x8e8): undefined reference to `trace_event_buffer_rese=
rve'
   loongarch64-linux-ld: mm/filemap.o: in function `trace_event_raw_event_f=
ilemap_set_wb_err':
   filemap.c:(.text+0x918): undefined reference to `trace_event_buffer_comm=
it'
   loongarch64-linux-ld: mm/filemap.o: in function `.L115':
   filemap.c:(.text+0x988): undefined reference to `__trace_trigger_soft_di=
sabled'
   loongarch64-linux-ld: mm/filemap.o: in function `.L116':
   filemap.c:(.text+0x9f8): undefined reference to `trace_event_buffer_rese=
rve'
   loongarch64-linux-ld: mm/filemap.o: in function `trace_event_raw_event_f=
ile_check_and_advance_wb_err':
   filemap.c:(.text+0xa40): undefined reference to `trace_event_buffer_comm=
it'
   loongarch64-linux-ld: mm/filemap.o: in function `.L128':
   filemap.c:(.text+0xaac): undefined reference to `__trace_trigger_soft_di=
sabled'
   loongarch64-linux-ld: mm/filemap.o: in function `.L124':
   filemap.c:(.text+0xae4): undefined reference to `trace_raw_output_prep'
   loongarch64-linux-ld: mm/filemap.o: in function `trace_raw_output_mm_fil=
emap_op_page_cache':
   filemap.c:(.text+0xb6c): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: filemap.c:(.text+0xb8c): undefined reference to `t=
race_handle_return'
   loongarch64-linux-ld: filemap.c:(.text+0xbb4): undefined reference to `t=
race_raw_output_prep'
   loongarch64-linux-ld: mm/filemap.o: in function `.L142':
   filemap.c:(.text+0xc20): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: mm/filemap.o: in function `trace_raw_output_filema=
p_set_wb_err':
   filemap.c:(.text+0xc40): undefined reference to `trace_handle_return'
   loongarch64-linux-ld: filemap.c:(.text+0xc6c): undefined reference to `t=
race_raw_output_prep'
   loongarch64-linux-ld: mm/filemap.o: in function `.L148':
   filemap.c:(.text+0xce8): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: mm/filemap.o: in function `trace_raw_output_file_c=
heck_and_advance_wb_err':
   filemap.c:(.text+0xd08): undefined reference to `trace_handle_return'
   loongarch64-linux-ld: mm/filemap.o:(.ref.data+0x18): undefined reference=
 to `trace_event_reg'
   loongarch64-linux-ld: mm/filemap.o:(.ref.data+0x40): undefined reference=
 to `trace_event_raw_init'
   loongarch64-linux-ld: mm/filemap.o:(.ref.data+0x60): undefined reference=
 to `trace_event_reg'
   loongarch64-linux-ld: mm/filemap.o:(.ref.data+0x88): undefined reference=
 to `trace_event_raw_init'
   loongarch64-linux-ld: mm/filemap.o:(.ref.data+0xa8): undefined reference=
 to `trace_event_reg'
   loongarch64-linux-ld: mm/filemap.o:(.ref.data+0xd0): undefined reference=
 to `trace_event_raw_init'
   loongarch64-linux-ld: mm/oom_kill.o: in function `perf_trace_oom_score_a=
dj_update':
   oom_kill.c:(.text+0x4a0): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: mm/oom_kill.o: in function `.L83':
   oom_kill.c:(.text+0x4fc): undefined reference to `perf_trace_run_bpf_sub=
mit'
   loongarch64-linux-ld: mm/oom_kill.o: in function `.L82':
   oom_kill.c:(.text+0x578): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: mm/oom_kill.o: in function `perf_trace_reclaim_ret=
ry_zone':
   oom_kill.c:(.text+0x66c): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: mm/oom_kill.o: in function `.L85':
   oom_kill.c:(.text+0x6c4): undefined reference to `perf_trace_run_bpf_sub=
mit'
   loongarch64-linux-ld: mm/oom_kill.o: in function `perf_trace_mark_victim=
':
   oom_kill.c:(.text+0x7b4): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: mm/oom_kill.o: in function `.L97':
   oom_kill.c:(.text+0x7e4): undefined reference to `perf_trace_run_bpf_sub=
mit'
   loongarch64-linux-ld: mm/oom_kill.o: in function `perf_trace_wake_reaper=
':
   oom_kill.c:(.text+0x8b4): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: mm/oom_kill.o: in function `.L109':
   oom_kill.c:(.text+0x8e4): undefined reference to `perf_trace_run_bpf_sub=
mit'
   loongarch64-linux-ld: mm/oom_kill.o: in function `perf_trace_start_task_=
reaping':
   oom_kill.c:(.text+0x9b4): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: mm/oom_kill.o: in function `.L121':
   oom_kill.c:(.text+0x9e4): undefined reference to `perf_trace_run_bpf_sub=
mit'
   loongarch64-linux-ld: mm/oom_kill.o: in function `perf_trace_finish_task=
_reaping':
   oom_kill.c:(.text+0xab4): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: oom_kill.c:(.text+0xae4): undefined reference to `=
perf_trace_run_bpf_submit'
   loongarch64-linux-ld: mm/oom_kill.o: in function `perf_trace_skip_task_r=
eaping':
   oom_kill.c:(.text+0xbb4): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: oom_kill.c:(.text+0xbe4): undefined reference to `=
perf_trace_run_bpf_submit'
   loongarch64-linux-ld: mm/oom_kill.o: in function `perf_trace_compact_ret=
ry':
   oom_kill.c:(.text+0xcdc): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: oom_kill.c:(.text+0xd38): undefined reference to `=
perf_trace_run_bpf_submit'
   loongarch64-linux-ld: mm/oom_kill.o: in function `.L156':
   oom_kill.c:(.text+0xe0c): undefined reference to `trace_event_buffer_res=
erve'
   loongarch64-linux-ld: mm/oom_kill.o: in function `trace_event_raw_event_=
oom_score_adj_update':
   oom_kill.c:(.text+0xe40): undefined reference to `trace_event_buffer_com=
mit'
   loongarch64-linux-ld: mm/oom_kill.o: in function `.L175':
   oom_kill.c:(.text+0xe8c): undefined reference to `__trace_trigger_soft_d=
isabled'
   loongarch64-linux-ld: mm/oom_kill.o: in function `trace_event_raw_event_=
reclaim_retry_zone':
   oom_kill.c:(.text+0xf30): undefined reference to `trace_event_buffer_res=
erve'
   loongarch64-linux-ld: oom_kill.c:(.text+0xf6c): undefined reference to `=
trace_event_buffer_commit'
   loongarch64-linux-ld: mm/oom_kill.o: in function `.L187':
   oom_kill.c:(.text+0xfe8): undefined reference to `__trace_trigger_soft_d=
isabled'
   loongarch64-linux-ld: mm/oom_kill.o: in function `.L183':
   oom_kill.c:(.text+0x1058): undefined reference to `trace_event_buffer_re=
serve'
   loongarch64-linux-ld: oom_kill.c:(.text+0x1068): undefined reference to =
`trace_event_buffer_commit'
   loongarch64-linux-ld: mm/oom_kill.o: in function `trace_event_raw_event_=
mark_victim':
   oom_kill.c:(.text+0x10a8): undefined reference to `__trace_trigger_soft_=
disabled'
   loongarch64-linux-ld: mm/oom_kill.o: in function `.L194':
   oom_kill.c:(.text+0x1118): undefined reference to `trace_event_buffer_re=
serve'
   loongarch64-linux-ld: oom_kill.c:(.text+0x1128): undefined reference to =
`trace_event_buffer_commit'
   loongarch64-linux-ld: mm/oom_kill.o: in function `trace_event_raw_event_=
wake_reaper':
   oom_kill.c:(.text+0x1168): undefined reference to `__trace_trigger_soft_=
disabled'
   loongarch64-linux-ld: mm/oom_kill.o: in function `.L205':
   oom_kill.c:(.text+0x11d8): undefined reference to `trace_event_buffer_re=
serve'
   loongarch64-linux-ld: oom_kill.c:(.text+0x11e8): undefined reference to =
`trace_event_buffer_commit'
   loongarch64-linux-ld: mm/oom_kill.o: in function `.L206':
   oom_kill.c:(.text+0x1228): undefined reference to `__trace_trigger_soft_=
disabled'
   loongarch64-linux-ld: mm/oom_kill.o: in function `.L220':
   oom_kill.c:(.text+0x1298): undefined reference to `trace_event_buffer_re=
serve'
   loongarch64-linux-ld: mm/oom_kill.o: in function `.L216':
   oom_kill.c:(.text+0x12a8): undefined reference to `trace_event_buffer_co=
mmit'
>> loongarch64-linux-ld: oom_kill.c:(.text+0x12e8): undefined reference to =
`__trace_trigger_soft_disabled'
   loongarch64-linux-ld: mm/oom_kill.o: in function `trace_event_raw_event_=
finish_task_reaping':
   oom_kill.c:(.text+0x1358): undefined reference to `trace_event_buffer_re=
serve'
   loongarch64-linux-ld: mm/oom_kill.o: in function `.L231':
   oom_kill.c:(.text+0x1368): undefined reference to `trace_event_buffer_co=
mmit'
   loongarch64-linux-ld: mm/oom_kill.o: in function `.L227':
   oom_kill.c:(.text+0x13a8): undefined reference to `__trace_trigger_soft_=
disabled'
   loongarch64-linux-ld: mm/oom_kill.o: in function `.L242':
   oom_kill.c:(.text+0x1438): undefined reference to `trace_event_buffer_re=
serve'
   loongarch64-linux-ld: mm/oom_kill.o: in function `.L238':
   oom_kill.c:(.text+0x1474): undefined reference to `trace_event_buffer_co=
mmit'
   loongarch64-linux-ld: mm/oom_kill.o: in function `trace_event_raw_event_=
compact_retry':
   oom_kill.c:(.text+0x14ec): undefined reference to `__trace_trigger_soft_=
disabled'
   loongarch64-linux-ld: oom_kill.c:(.text+0x1524): undefined reference to =
`trace_raw_output_prep'
   loongarch64-linux-ld: mm/oom_kill.o: in function `.L249':
   oom_kill.c:(.text+0x1578): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: oom_kill.c:(.text+0x1598): undefined reference to =
`trace_handle_return'
   loongarch64-linux-ld: oom_kill.c:(.text+0x15c4): undefined reference to =
`trace_raw_output_prep'
   loongarch64-linux-ld: mm/oom_kill.o: in function `trace_raw_output_oom_s=
core_adj_update':
   oom_kill.c:(.text+0x1610): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: oom_kill.c:(.text+0x1630): undefined reference to =
`trace_handle_return'
   loongarch64-linux-ld: oom_kill.c:(.text+0x165c): undefined reference to =
`trace_raw_output_prep'
   loongarch64-linux-ld: mm/oom_kill.o: in function `trace_raw_output_mark_=
victim':
   oom_kill.c:(.text+0x16b0): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: oom_kill.c:(.text+0x16d0): undefined reference to =
`trace_handle_return'
   loongarch64-linux-ld: oom_kill.c:(.text+0x16fc): undefined reference to =
`trace_raw_output_prep'
   loongarch64-linux-ld: mm/oom_kill.o: in function `trace_raw_output_wake_=
reaper':
   oom_kill.c:(.text+0x1750): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: oom_kill.c:(.text+0x1770): undefined reference to =
`trace_handle_return'
   loongarch64-linux-ld: oom_kill.c:(.text+0x179c): undefined reference to =
`trace_raw_output_prep'
   loongarch64-linux-ld: mm/oom_kill.o: in function `.L280':
   oom_kill.c:(.text+0x17f0): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: mm/oom_kill.o: in function `trace_raw_output_start=
_task_reaping':
   oom_kill.c:(.text+0x1810): undefined reference to `trace_handle_return'
   loongarch64-linux-ld: oom_kill.c:(.text+0x183c): undefined reference to =
`trace_raw_output_prep'
   loongarch64-linux-ld: mm/oom_kill.o: in function `.L286':
   oom_kill.c:(.text+0x1890): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: mm/oom_kill.o: in function `trace_raw_output_finis=
h_task_reaping':
   oom_kill.c:(.text+0x18b0): undefined reference to `trace_handle_return'
   loongarch64-linux-ld: oom_kill.c:(.text+0x18dc): undefined reference to =
`trace_raw_output_prep'
   loongarch64-linux-ld: mm/oom_kill.o: in function `.L292':
   oom_kill.c:(.text+0x1938): undefined reference to `trace_print_symbols_s=
eq'
   loongarch64-linux-ld: mm/oom_kill.o: in function `trace_raw_output_skip_=
task_reaping':
   oom_kill.c:(.text+0x1970): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: oom_kill.c:(.text+0x1994): undefined reference to =
`trace_handle_return'
   loongarch64-linux-ld: mm/oom_kill.o: in function `.L298':
   oom_kill.c:(.text+0x19bc): undefined reference to `trace_raw_output_prep'
   loongarch64-linux-ld: mm/oom_kill.o: in function `trace_raw_output_recla=
im_retry_zone':
   oom_kill.c:(.text+0x1a28): undefined reference to `trace_print_symbols_s=
eq'
   loongarch64-linux-ld: oom_kill.c:(.text+0x1a40): undefined reference to =
`trace_print_symbols_seq'
   loongarch64-linux-ld: mm/oom_kill.o: in function `.L304':
   oom_kill.c:(.text+0x1a68): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: oom_kill.c:(.text+0x1a94): undefined reference to =
`trace_handle_return'
   loongarch64-linux-ld: mm/oom_kill.o:(.ref.data+0x18): undefined referenc=
e to `trace_event_reg'
   loongarch64-linux-ld: mm/oom_kill.o:(.ref.data+0x40): undefined referenc=
e to `trace_event_raw_init'
   loongarch64-linux-ld: mm/oom_kill.o:(.ref.data+0x60): undefined referenc=
e to `trace_event_reg'
   loongarch64-linux-ld: mm/oom_kill.o:(.ref.data+0x88): undefined referenc=
e to `trace_event_raw_init'
   loongarch64-linux-ld: mm/oom_kill.o:(.ref.data+0xa8): undefined referenc=
e to `trace_event_reg'
   loongarch64-linux-ld: mm/oom_kill.o:(.ref.data+0xd0): undefined referenc=
e to `trace_event_raw_init'
   loongarch64-linux-ld: mm/oom_kill.o:(.ref.data+0xf0): undefined referenc=
e to `trace_event_reg'
   loongarch64-linux-ld: mm/oom_kill.o:(.ref.data+0x118): undefined referen=
ce to `trace_event_raw_init'
   loongarch64-linux-ld: mm/oom_kill.o:(.ref.data+0x138): undefined referen=
ce to `trace_event_reg'
   loongarch64-linux-ld: mm/oom_kill.o:(.ref.data+0x160): undefined referen=
ce to `trace_event_raw_init'
   loongarch64-linux-ld: mm/oom_kill.o:(.ref.data+0x180): undefined referen=
ce to `trace_event_reg'
   loongarch64-linux-ld: mm/oom_kill.o:(.ref.data+0x1a8): undefined referen=
ce to `trace_event_raw_init'
   loongarch64-linux-ld: mm/oom_kill.o:(.ref.data+0x1c8): undefined referen=
ce to `trace_event_reg'
   loongarch64-linux-ld: mm/oom_kill.o:(.ref.data+0x1f0): undefined referen=
ce to `trace_event_raw_init'
   loongarch64-linux-ld: mm/oom_kill.o:(.ref.data+0x210): undefined referen=
ce to `trace_event_reg'
   loongarch64-linux-ld: mm/oom_kill.o:(.ref.data+0x238): undefined referen=
ce to `trace_event_raw_init'
   loongarch64-linux-ld: mm/swap.o: in function `.L20':
   swap.c:(.text+0x13c): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: swap.c:(.text+0x1dc): undefined reference to `perf=
_trace_run_bpf_submit'
   loongarch64-linux-ld: mm/swap.o: in function `.L32':
   swap.c:(.text+0x2d4): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: mm/swap.o: in function `.L38':
   swap.c:(.text+0x42c): undefined reference to `perf_trace_run_bpf_submit'
   loongarch64-linux-ld: mm/swap.o: in function `trace_event_raw_event_mm_l=
ru_insertion':
   swap.c:(.text+0x560): undefined reference to `trace_event_buffer_reserve'
   loongarch64-linux-ld: mm/swap.o: in function `.L63':
   swap.c:(.text+0x69c): undefined reference to `trace_event_buffer_commit'
   loongarch64-linux-ld: mm/swap.o: in function `.L75':
   swap.c:(.text+0x72c): undefined reference to `__trace_trigger_soft_disab=
led'
   loongarch64-linux-ld: mm/swap.o: in function `trace_event_raw_event_mm_l=
ru_activate':
   swap.c:(.text+0x7c0): undefined reference to `trace_event_buffer_reserve'
   loongarch64-linux-ld: mm/swap.o: in function `.L80':
   swap.c:(.text+0x844): undefined reference to `trace_event_buffer_commit'
   loongarch64-linux-ld: mm/swap.o: in function `.L76':
   swap.c:(.text+0x8ac): undefined reference to `__trace_trigger_soft_disab=
led'
   loongarch64-linux-ld: swap.c:(.text+0x8e4): undefined reference to `trac=
e_raw_output_prep'
   loongarch64-linux-ld: mm/swap.o: in function `.L105':
   swap.c:(.text+0x978): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: mm/swap.o: in function `.L107':
   swap.c:(.text+0x998): undefined reference to `trace_handle_return'
   loongarch64-linux-ld: mm/swap.o: in function `.L102':
   swap.c:(.text+0xa64): undefined reference to `trace_raw_output_prep'
   loongarch64-linux-ld: mm/swap.o: in function `.L100':
   swap.c:(.text+0xab4): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: mm/swap.o: in function `trace_raw_output_mm_lru_ac=
tivate':
   swap.c:(.text+0xad4): undefined reference to `trace_handle_return'
   loongarch64-linux-ld: mm/swap.o:(.ref.data+0x18): undefined reference to=
 `trace_event_reg'
   loongarch64-linux-ld: mm/swap.o:(.ref.data+0x40): undefined reference to=
 `trace_event_raw_init'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
   Depends on [n]: CRYPTO [=3Dy] && ASYMMETRIC_KEY_TYPE [=3Dn]
   Selected by [y]:
   - PGP_PRELOAD_PUBLIC_KEYS [=3Dy] && CRYPTO [=3Dy]

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
